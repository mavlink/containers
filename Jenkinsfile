pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {

        stage('qgc-build-linux') {
          agent {
            dockerfile {
              filename 'Dockerfile_qgc-build-linux'
              args '-e CCACHE_BASEDIR=$WORKSPACE -v ${CCACHE_DIR}:${CCACHE_DIR}:rw'
            }
          }
          steps {
            git 'https://github.com/mavlink/qgroundcontrol.git'
            dir(path: 'Firmware') {
              sh 'export'
              //sh 'make clean'
              sh 'ccache -z'
              //sh 'make'
              sh 'ccache -s'
              //sh 'make clean'
            }
          }
        }

        stage('qgc-build-android') {
          agent {
            dockerfile {
              filename 'Dockerfile_qgc-build-android'
              args '-e CCACHE_BASEDIR=$WORKSPACE -v ${CCACHE_DIR}:${CCACHE_DIR}:rw'
            }
          }
          steps {
            git 'https://github.com/mavlink/qgroundcontrol.git'
            dir(path: 'Firmware') {
              sh 'export'
              //sh 'make clean'
              sh 'ccache -z'
              //sh 'make'
              sh 'ccache -s'
              //sh 'make clean'
            }
          }
        }

      }
    }
  }

  environment {
    CCACHE_DIR = '/tmp/ccache'
    CI = true
  }
  options {
    buildDiscarder(logRotator(numToKeepStr: '10', artifactDaysToKeepStr: '30'))
    timeout(time: 60, unit: 'MINUTES')
  }

}
