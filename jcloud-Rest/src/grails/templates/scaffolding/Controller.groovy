import javax.servlet.http.HttpServletResponse
import grails.converters.*
<%=packageName ? "package ${packageName}\n\n" : ''%>class ${className}Controller {

	///////////////////////////////////////////////////////////////
    ////           API - RESTFULL - jRestFull-API 1.4          ////
	////           @Paulo Castro v4                            ////            
	///////////////////////////////////////////////////////////////
    
    def index = { redirect(action:list,params:params) }

    def listar = {
        def objJson = ${className}.list() ?: []
		def arrObjJson=[]
     	if(params.id)
        {
			if(${className}.findById(params.id)){
			arrObjJson.add(${className}.findById(params.id))
			render arrObjJson as JSON}
			if(!${className}.findById(params.id)){
			def json='{"id":'+"\${params.id}"+',"msg":"${className} nao encontrado!"}'
			render json}
        }
	    else{render objJson as JSON}
    }
	
	  def deletar = {	
		if(${className}.findById(request.JSON.id)){
		${className}.get(request.JSON.id)?.delete()
		render "${className} Id:\${request.JSON.id} Deletado com sucesso!"}
		else{render "\${className} Id:\${request.JSON.id} nao encontrado!"}
	}

    def editar = {
        ${className} c = ${className}.get(request.JSON.id)
		c.properties = request.JSON	
		if(c.save()){render "${className} Id:\${c.id} - Editado com sucesso!!" 
		}else{render "Erro: Id: \${c.id} nao encontrado!"}
    }

    def salvar = {
         def ${propertyName} = new ${className}(request.JSON)
		if(${propertyName}.save()){
			render "${className} Id:\${${propertyName}.id} - Salvo com sucesso!" 
		}else{render "Erro: ${className} nao foi salvo!"}	    
    }
   
    def list = {
        if(!params.max) params.max = 10
        [ ${propertyName}List: ${className}.list( params ) ]
    }

    def show = {
        def ${propertyName} = ${className}.get( params.id )

        if(!${propertyName}) {
            flash.message = "${className} não encontrado id \${params.id}"
            redirect(action:list)
        }
        else { return [ ${propertyName} : ${propertyName} ] }
    }

    def delete = {
        def ${propertyName} = ${className}.get( params.id )
        if(${propertyName}) {
            ${propertyName}.delete()
            flash.message = "${className} \${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "${className} não encontrado id \${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def ${propertyName} = ${className}.get( params.id )

        if(!${propertyName}) {
            flash.message = "${className} não encontrado id \${params.id}"
            redirect(action:list)
        }
        else {
            return [ ${propertyName} : ${propertyName} ]
        }
    }

    def update = {
        def ${propertyName} = ${className}.get( params.id )
        if(${propertyName}) {
            ${propertyName}.properties = params
            if(!${propertyName}.hasErrors() && ${propertyName}.save()) {
                flash.message = "${className} \${params.id} updated"
                redirect(action:show,id:${propertyName}.id)
            }
            else {
                render(view:'edit',model:[${propertyName}:${propertyName}])
            }
        }
        else {
            flash.message = "${className} não encontrado id \${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def ${propertyName} = new ${className}()
        ${propertyName}.properties = params
        return ['${propertyName}':${propertyName}]
    }

    def save = {
        def ${propertyName} = new ${className}(params)
        if(!${propertyName}.hasErrors() && ${propertyName}.save()) {
            flash.message = "${className} \${${propertyName}.id} cadastrado"
            redirect(action:show,id:${propertyName}.id)
        }
        else {
            render(view:'create',model:[${propertyName}:${propertyName}])
        }
    }
}
