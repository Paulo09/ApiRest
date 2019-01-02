/*
 * jCloud Versao 1.2 - RESTFULL
 */

import org.codehaus.groovy.grails.commons.GrailsClassUtils as GCU

Ant.property(environment:"env")                             
grailsHome = Ant.antProject.properties."env.GRAILS_HOME"   

includeTargets << new File ( "${grailsHome}/scripts/Init.groovy" )
    
class HelpEvaluatingCategory {     
	static defaultTask = ""
	static target(Object obj, Map args, Closure callable) {
		def e = args.find { e -> e.key == "default" }?.value
		if(e) {
			defaultTask = e
		}
	}                     
	static getDefaultTask(Object obj) {
		return defaultTask
	}
	
}

File getHelpFile(File script) {
    File helpDir = new File(grailsTmp, "help")
    if (!helpDir.exists()) helpDir.mkdir()
    String scriptname = script.getName()
	return new File(helpDir, scriptname.substring(0, scriptname.lastIndexOf('.')) + ".txt")
}

boolean shouldGenerateHelp(File script) {
	File file = getHelpFile(script)
    return (!file.exists() || file.lastModified() < script.lastModified() )
}
                                

target ( 'default' : "Prints out the help for each script") {
	Ant.mkdir(dir:grailsTmp)    	
	def scripts = []   
    resolveResources("file:${grailsHome}/scripts/**.groovy").each { if (!it.file.name.startsWith('_')) scripts << it.file }
	resolveResources("file:${basedir}/scripts/*.groovy").each { if (!it.file.name.startsWith('_')) scripts << it.file }
	
	if(new File("${basedir}/plugins").exists()) {	
		resolveResources("file:${basedir}/plugins/*/scripts/*.groovy").each { if (!it.file.name.startsWith('_')) scripts << it.file }
	}

	if(new File("${userHome}/.grails/scripts/").exists()) {
		resolveResources("file:${userHome}/.grails/scripts/*.groovy").each { if (!it.file.name.startsWith('_')) scripts << it.file }
	}
        
	def helpText = ""
      
	
	if(args) {  
		def fileName = GCU.getNameFromScript(args) + ".groovy"
		def file = scripts.find { it.name == fileName }
		
		
		println """
Usage (optionals marked with *): 		
jcloud [environment]*		
		"""         
		def gcl = new GroovyClassLoader()    				
		use(HelpEvaluatingCategory.class) {    
			if (shouldGenerateHelp(file)) {
				try {
					def script = gcl.parseClass(file).newInstance()			
					script.binding = binding
					script.run()

					def scriptName = GCU.getScriptName(file.name)

					helpText = "jcloud ${scriptName} -- ${getDefaultTask()}"					
					File helpFile = getHelpFile(file)
					if(!helpFile.exists())
					    helpFile.createNewFile()
                    helpFile.write(helpText)
				}                                                      
				catch(Throwable t) {
					println "Warning: Error caching created help for ${file}: ${t.message}"
					println helpText
				}
			} else {
				helpText = getHelpFile(file).text
			}
			println helpText  
		}		
	}	
	else {
			println """
		Usage (optionals marked with *): 
		jcloud [environment]* [target] [arguments]*

		Examples: 
		jcloud dev run-app	
		jcloud create-app books

		Available Targets (type grails help 'target-name' for more info):"""
		
	    scripts.unique { it.name }. sort{ it.name }.each { file ->
			def scriptName = GCU.getScriptName(file.name)  
			println "jcloud ${scriptName}"   
		}		
	}  
}                                               

target( showHelp: "Show help for a particular command") {
	def gcl = new GroovyClassLoader()    				
	use(HelpEvaluatingCategory.class) {    
		if (shouldGenerateHelp(file)) {
			try {
				def script = gcl.parseClass(file).newInstance()			
				script.binding = binding
				script.run()

				def scriptName = GCU.getScriptName(file.name)

				helpText = "grails ${scriptName} -- ${getDefaultTask()}"					
				getHelpFile(file).write(helpText) 		  		
			}                                                      
			catch(Throwable t) {
				println "Error creating help for ${file}: ${t.message}"
				t.printStackTrace(System.out)
			}
		} else {
			helpText = getHelpFile(file).text
		}
		println helpText  
	}	   		
	
}
