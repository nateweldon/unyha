package webprojects

import grails.converters.JSON
import java.text.SimpleDateFormat
import com.google.appengine.repackaged.org.joda.time.DateTime

class EventsController {
    static navigation = [
            order:3,
            title:'Upcoming Events',
            action:'manage'

    ]

    def persistenceManager

    def calendarEventService

    def index = {
        redirect(action:"manage")
    }
    def manage = {



    }

    def eventList = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        def query = persistenceManager.newQuery(CalendarEventsJDO)
        def calendarEventsInstanceList = query.execute()
        def total = 0
        //   if (calendarEventsInstanceList && calendarEventsInstanceList.size() > 0) {
        //      total = calendarEventsInstanceList.size()
        //  }
        // render calendarEventsInstanceList as JSON
        render createJSON(calendarEventsInstanceList)

    }


    private String createJSON(List<CalendarEventsJDO> events) {
        def json="["
        boolean first=true

        //Calendar c=Calendar.get(id)
        events.each{
            if(first){
                first=false
                json+="{"
            }
            else {
                json+=",{"
            }

            json+="\"title\":\""+ it.getTitle()+"\","
            json+="\"start\":\""+ calendarEventService.convertDate(it.getDate()) +"\","
            json+="\"end\":\""+ calendarEventService.convertDate(it.getDate()) +"\","
            json+="\"allDay\":\""+"true"+"\","
            json+="\"description\":\""+ it.getSummary() + "\""
            //json+="url:\"${request.contextPath}/event/show/"+it.id+"\","
//            json+="backgroundColor:'"+"blue"+"',"
//            json+="textColor:'"+"white"+"'"
            json+="}"
        }
        json+="]"
        return json
    }

}
