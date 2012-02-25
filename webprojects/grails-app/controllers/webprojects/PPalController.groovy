package webprojects

class PPalController {

    def index = { }

    	def buy = {
	//	def payment
//		if (params.transactionId) {
//			payment = Payment.findByTransactionId(params.transactionId)
//		}
//		else {
//			payment = new Payment(params)
//			payment.addToPaymentItems(new PaymentItem(params))
//		}

//		if (params.transactionID) log.debug "Resuming existing transaction $payment"
//		if (payment?.validate()) {
//			request.payment = payment
//			payment.save(flush: true)
			def config = grailsApplication.config.grails.paypal
			def server = config.server
			def baseUrl = params.baseUrl
			def login = params.email ?: config.email
			if (!server || !login) throw new IllegalStateException("Paypal misconfigured! You need to specify the Paypal server URL and/or account email. Refer to documentation.")

			def commonParams = [buyerId: params.buyerId, transactionId: params.transactionId]
			if (params.returnAction) {
				commonParams.returnAction = params.returnAction
			}
			if (params.returnController) {
				commonParams.returnController = params.returnController
			}
			if (params.cancelAction) {
				commonParams.cancelAction = params.cancelAction
			}
			if (params.cancelController) {
				commonParams.cancelController = params.cancelController
			}
			def notifyURL = g.createLink(absolute: baseUrl==null, base: baseUrl, controller: 'PPal', action: 'notify', params: commonParams).encodeAsURL()
			def successURL = g.createLink(absolute: baseUrl==null, base: baseUrl, controller: 'PPal', action: 'success', params: commonParams).encodeAsURL()
			def cancelURL = g.createLink(absolute: baseUrl==null, base: baseUrl, controller: 'PPal', action: 'cancel', params: commonParams).encodeAsURL()

			def url = new StringBuffer("$server?")
			url << "cmd=_xclick&"
			url << "business=$login&"
			url << "item_name=${params.itemName}&"
			url << "item_number=${params.itemNumber}&"
			url << "quantity=${params.quantity}&"
			url << "amount=${params.amount}&"
            if (params.discountAmount > 0) {
                url << "discount_amount=${params.discountAmount}&"
            }
			url << "tax=${params.tax}&"
			url << "currency_code=${params.currency}&"
			url << "notify_url=${notifyURL}&"
			url << "return=${successURL}&"
			url << "cancel_return=${cancelURL}"

			log.debug "Redirection to PayPal with URL: $url"

			redirect(url: url)
//		}
//		else {
//			flash.payment = payment
//			redirect(url: params.originalURL)
//		}
	}


	def success = {
		def payment = Payment.findByTransactionId(params.transactionId)
		log.debug "Success notification received from PayPal for $payment with transaction id ${params.transactionId}"
		if (payment) {
			request.payment = payment
			if (payment.status != Payment.COMPLETE) {
				payment.status = Payment.COMPLETE
				payment.save(flush: true)
			}

			if (params.returnAction || params.returnController) {
				def args = [:]
				if (params.returnAction) args.action = params.returnAction
				if (params.returnController) args.controller = params.returnController
				args.params = params
				redirect(args)
			}
			else {
				return [payment: payment]
			}
		}
		else {
			response.sendError 403
		}
	}

	def cancel = {
		def payment = Payment.findByTransactionId(params.transactionId)
		log.debug "Cancel notification received from PayPal for $payment with transaction id ${params.transactionId}"
		if (payment) {
			request.payment = payment
			if (payment.status != Payment.COMPLETE) {
				payment.status = Payment.CANCELLED
				payment.save(flush: true)
				if (params.cancelAction || params.cancelController) {
					def args = [:]
					if (params.cancelAction) args.action = params.cancelAction
					if (params.cancelController) args.controller = params.cancelController
					args.params = params
					redirect(args)
				}
				else {
					return [payment: payment]
				}
			}
			else {
				response.sendError 403
			}
		}
		else {
			response.sendError 403
		}

	}

    def notifyPaypal = {
        log.debug "Received IPN notification from PayPal Server ${params}"
        def config = grailsApplication.config.grails.paypal
        def server = config.server
        def login = params.email ?: config.email
        if (!server || !login) throw new IllegalStateException("Paypal misconfigured! You need to specify the Paypal server URL and/or account email. Refer to documentation.")

        params.cmd = "_notify-validate"
        def queryString = params.toQueryString()[1..-1]

        log.debug "Sending back query $queryString to PayPal server $server"
        def url = new URL(server)
        def conn = url.openConnection()
        conn.doOutput = true
        def writer = new OutputStreamWriter(conn.getOutputStream())
        writer.write queryString
        writer.flush()

        def result = conn.inputStream.text?.trim()

        log.debug "Got response from PayPal IPN $result"

        def payment = Payment.findByTransactionId(params.transactionId)

        if (payment && result == 'VERIFIED') {
            if (params.receiver_email != login) {
                log.warn """WARNING: receiver_email parameter received from PayPal does not match configured e-mail. This request is possibly fraudulent!
REQUEST INFO: ${params}
                """
            }
            else {
                request.payment = payment
                def status = params.payment_status
                if (payment.status != Payment.COMPLETE && payment.status != Payment.CANCELLED) {
                    if (payment.paypalTransactionId && payment.paypalTransactionId == params.txn_id) {
                        log.warn """WARNING: Request tried to re-use and old PayPal transaction id. This request is possibly fraudulent!
        REQUEST INFO: ${params} """
                    }
                    else if (status == 'Completed') {
                        payment.paypalTransactionId = params.txn_id
                        payment.status = Payment.COMPLETE
                        updateBuyerInformation(payment, params)
                        log.info "Verified payment ${payment} as COMPLETE"
                    } else if (status == 'Pending') {
                        payment.paypalTransactionId = params.txn_id
                        payment.status = Payment.PENDING
                        updateBuyerInformation(payment, params)
                        log.info "Verified payment ${payment} as PENDING"
                    } else if (status == 'Failed') {
                        payment.paypalTransactionId = params.txn_id
                        payment.status = Payment.FAILED
                        updateBuyerInformation(payment, params)
                        log.info "Verified payment ${payment} as FAILED"
                    }
                }
                payment.save(flush: true)
            }
        }
        else {
            log.debug "Error with PayPal IPN response: [$result] and Payment: [${payment?.transactionId}]"
        }
        render "OK" // Paypal needs a response, otherwise it will send the notification several times!
    }

}
