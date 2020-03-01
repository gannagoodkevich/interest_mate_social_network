require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require('tether')

import "bootstrap";

import fileUpload from 'fileUpload'

// listen on 'turbolinks:load' instead of 'DOMContentLoaded' if using Turbolinks
document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.upload-file').forEach(fileInput => {
        fileUpload(fileInput)
    })
})

import toastr from 'toastr'
window.toastr = toastr