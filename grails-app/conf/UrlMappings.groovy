class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		//"/"(controller:"index", action:"view")
		"/"(controller: "index", action: "index")
                //"/index"(controller: "index", action: "index")
                //"/index"(controller: "index", view: "index") // to a view for a controller
		"500"(view:'/error')
	}
}
