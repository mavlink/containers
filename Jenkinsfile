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
            dir(path: 'qgroundcontrol') {
              sh 'ccache -z'
              sh 'ls'
              sh 'mkdir build'
              dir(path: 'build') {
                sh 'qmake ..'
                sh 'make'
              }
              sh 'ccache -s'
              sh 'git clean -ff -x -d .'
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
            dir(path: 'qgroundcontrol') {
              sh 'export'
              sh 'git clean -ff -x -d .'
              sh 'ccache -z'
              sh 'ls'
              //sh 'make android'
              sh 'ccache -s'
              sh 'git clean -ff -x -d .'
            }
          }
        }

        stage('qgc-build-android_arm64_v8a') {
          agent {
            dockerfile {
              filename 'Dockerfile_qgc-build-android_arm64_v8a'
              args '-e CCACHE_BASEDIR=$WORKSPACE -v ${CCACHE_DIR}:${CCACHE_DIR}:rw'
            }
          }
          steps {
            git 'https://github.com/mavlink/qgroundcontrol.git'
            dir(path: 'qgroundcontrol') {
              sh 'export'
              sh 'git clean -ff -x -d .'
              sh 'ccache -z'
              sh 'ls'
              //sh 'make android'
              sh 'ccache -s'
              sh 'git clean -ff -x -d .'
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
