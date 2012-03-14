package webprojects



class MembershipController {
    static navigation = [
            order:2,
            title:'Membership',
            action:'manage'

    ]



    def index = {
        redirect(action:"manage")
    }

    def manage = {

    }

    def becomeAMember = {

        redirect(controller: "memberJDO", action: "list")
    }

    def showCal = {
        redirect(action: "manage")
    }
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
}
