module.exports = function(grunt) {

  grunt.initConfig({
    coffee: {
      dist: {
        expand: true,
        cwd: 'src/js',
        src: ['**/*.coffee'],
        dest: '.tmp/js',
        ext: '.js'
      }
    },
    copy: {
      dist: {
        files: [{
          expand: true,
          cwd: 'src',
          src: ['**/*.{jpg,ico}'],
          dest: 'dist'
        }, {
          src: 'bower_components/superscrollorama/js/jquery.superscrollorama.js',
          dest: 'dist/js/superscrollorama.js'
        }]
      }
    },
    uglify: {
      options: {
        banner: '/*! (c) 2014 by Connor Peet */\n'
      },
      dist: {
        files: [{
          expand: true,
          cwd: '.tmp/js',
          src: ['*.js'],
          dest: 'dist/js',
          ext: '.js'
        }]
      }
    },
    less: {
      dist: {
        options: {
          yuicompress: true,
          concat: false
        },
        files: [{
          expand: true,
          cwd: 'src/css',
          src: ['*.less'],
          dest: 'dist/css',
          ext: '.css'
        }]
      }
    },
    htmlmin: {
      dist: {
        options: {
          removeComments: true,
          collapseWhitespace: true
        },
        files: [{
          expand: true,
          cwd: 'src',
          src: ['**/*.html'],
          dest: 'dist',
          ext: '.html'
        }]
      }
    },
    imagemin: {
      dist: {
        options: {
          removeComments: true
        },
        files: [{
          expand: true,
          cwd: 'src',
          src: ['**/*.{png,gif}'],
          dest: 'dist',
        }]
      }
    },
    concurrent: {
      build: ['coffee', 'less', 'imagemin', 'htmlmin', 'copy'],
      postbuild: ['uglify'],
      watch: ['watch:coffee', 'watch:less', 'watch:html']
    },
    clean: {
      pre: ['dist/css', 'dist/img', 'dist/js', 'dist/*.html'],
      post: ['.tmp']
    },
    watch: {
      coffee: {
        files: ['src/js/*.coffee'],
        tasks: ['coffee', 'uglify']
      },
      less: {
        files: ['src/css/*.less'],
        tasks: ['less']
      },
      html: {
        files: ['src/*.html'],
        tasks: ['htmlmin']
      },
    },
  });

  grunt.loadNpmTasks('grunt-concurrent');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-contrib-htmlmin');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.registerTask('default', ['clean:pre', 'concurrent:build', 'concurrent:postbuild', 'clean:post']);
  grunt.registerTask('spy', ['clean:pre', 'concurrent:build', 'concurrent:postbuild', 'clean:post', 'concurrent:watch']);

};