class UrlMappings {
    static mappings = {
    "/$controller/$action?/$id?"{constraints {}}
		"/api/$controller/$id?"{action = [GET:"listar", POST:"salvar", PUT:"editar", DELETE:"deletar"]}
	  "500"(view:'/error')
	}
}
