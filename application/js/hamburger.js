$(function () {
    $("#js-hamburger").on("click", function () {
        console.log("terstewtewt");
        $(this).toggleClass('active');
        $('#js-nav').toggleClass('active');
        // $('#js-nav').css("backgound", 'red')
    });
});
// const ham = document.querySelector('#js-hamburger');
// const nav = document.querySelector('#js-nav');

// ham.addEventListener('click', function () {
// console.log("testteststset")
//   ham.classList.toggle('active');
//   nav.classList.toggle('active');

// });


