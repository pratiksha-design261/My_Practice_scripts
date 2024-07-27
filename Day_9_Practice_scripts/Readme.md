


Pipeline groovy script basic example:
pipeline{
    
    agent any; 
    
    stages{
        stage("Code"){
            steps{
                echo "Code is pushed in GitHub"
            }
        }
        stage("Build"){
            steps{
                echo "Git repo is buid successfully"
            }
        }
        stage("Test"){
            steps{
                echo "All test cases are passed"
            }
        }
        stage("Deploy"){
            steps{
                echo "Code deployed to Production"
            }
        }
    }
}
