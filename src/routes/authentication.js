const express = require('express');
const router = express.Router();

const passport = require('passport');
const { isLoggedIn, isNotLoggedIn } = require('../lib/auth')

//esta ruta es para renderizar el formulario
router.get('/signup',isLoggedIn, isNotLoggedIn, (req, res) => {
    res.render('auth/signup');
});



//esta ruta es para recivir los datos del usurio
router.post('/signup', isLoggedIn, isNotLoggedIn, passport.authenticate('local.signup', {
    successRedirect: '/profile',
    failureRedirect: '/signup',
    failureFlash: true
}));
//



router.get('/signin', isNotLoggedIn, (req, res) => {
    res.render('auth/signin');
});

router.post('/signin', isNotLoggedIn, (req, res, next) => {
    passport.authenticate('local.signin', {
        successRedirect: '/profile',
        failureRedirect: '/signin',
        failureFlash: true
    })(req, res, next);
    
});


router.get('/profile', isLoggedIn,(req, res) => {
    res.render('profile');
});


router.get('/logout', (req, res) => {
    req.logOut();
    res.redirect('/signin');
});

module.exports = router;  