const express = require('express');
const router = express.Router();
const galleryController = require('../controllers/gallery.controller');

//get all gallary
router.get('/all', galleryController.getAllGalleryList);

router.get('/', galleryController.getGalleryById);

router.post('/',galleryController.createNewGallery);

router.put('/',galleryController.updateGalleryById);

router.delete('/',galleryController.deleteGalleryById);


module.exports = router;