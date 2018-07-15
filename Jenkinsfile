pipeline{
	
	agent any
	
	//def buildNumber = env.BUILD_NUMBER
	//def workspace = env.WORKSPACE
	//echo "build NUMBER is ${buildNumber}"


	stages{

		stage('Fetch from git repo'){

			steps{

				git url: 'https://github.com/sanjaysureshmv/game-of-life.git'
					echo "workspace is ${env.workspace}"
			}
		}

		stage('Build the project using maven'){

			steps{

				sh('mvn package')
			}
		}

		stage('Pass the war file and ip of docker host to downstream job'){
		    
		    environment { 
		        
                 docker_host = "52.24.73.203"
            }


			steps{
			    
			    sh "scp ${env.workspace}/gameoflife-web/target/gameoflife.war jenkins@${docker_host}:/home/jenkins/workspace/pipeline-gol/" 

				}
		}



		stage('clone the repo to docker host'){
		     agent{ node{label 'docker'}}
			steps{

				git url: 'https://github.com/sanjaysureshmv/game-of-life.git'
				echo "workspace is ${env.workspace}"
			}



		}
		stage('Login to the docker hub'){
		    agent{ node{label 'docker'}
		        
		    }
		    steps{
		    
		    
		    withCredentials([string(credentialsId: 'dockerpwd', variable: 'dockerhubpwd')]) {
		        
                 sh "docker login -u sanjaymv -p ${dockerhubpwd}"
                 }                
             }
		    
		}
		
		stage('Build the docker image and push to docker hub'){
		    agent{ node{label 'docker'}

			}
		
		steps{
		
		sh "docker build -t sanjaymv/golpipeline:${env.BUILD_NUMBER} ."
		sh "docker push sanjaymv/golpipeline:${env.BUILD_NUMBER}"
		    
		}
	}

		
		}
	}
	
