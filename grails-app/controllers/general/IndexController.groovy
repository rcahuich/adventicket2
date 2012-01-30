package general

class IndexController {

    def index = {
        log.debug "Controller Indexxxxx"
        redirect view:"/index"
    }
}
