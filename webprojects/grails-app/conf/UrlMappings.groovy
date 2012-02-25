class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}



		"/"(controller:"homeViewer")
		"500"(view:'/error')
	}
}
