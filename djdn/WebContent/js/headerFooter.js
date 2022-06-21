$(".sub_menu_top").on("click",function(e){
    // $(".sub_menu").removeClass("on");

    $(this).children(".sub_menu").toggleClass("on");
    $(this).siblings(".sub_menu_top").children(".sub_menu").removeClass("on");
})