/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {



    $('#all').slideDown(2000);
   

    $('.proudct').mouseenter(function () {
        $(this).animate({height: "+=10px", width: "+=20px", opacity: '10'}, 10, function () {
            $('.proudct').mouseleave(function () {
                $(this).animate({height: "130px", width: "130px", opacity: '1.5'}, 10



                        );


            });

        }
        );


    });



});