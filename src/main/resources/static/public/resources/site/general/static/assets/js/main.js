/**
 * selectImages
 * preloader
 * Scroll process
 * Button Quantity
 * Delete file
 * Go Top
 * color swatch product
 * change value
 * footer accordion
 * close announcement bar
 * sidebar mobile
 * tabs
 * flatAccordion
 * button wishlist
 * button loading
 * variant picker
 * switch layout
 * item checkbox
 * infinite scroll
 * stagger wrap
 * filter
 * modal second
 * header sticky
 * header change background
 * img group
 * contact form
 * subscribe mailchimp
 * auto popup

 */


(function ($) {
  "use strict";

  var isMobile = {
    Android: function () {
      return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function () {
      return navigator.userAgent.match(/BlackBerry/i);
    },
    iOS: function () {
      return navigator.userAgent.match(/iPhone|iPad|iPod/i);
    },
    Opera: function () {
      return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function () {
      return navigator.userAgent.match(/IEMobile/i);
    },
    any: function () {
      return (
        isMobile.Android() ||
        isMobile.BlackBerry() ||
        isMobile.iOS() ||
        isMobile.Opera() ||
        isMobile.Windows()
      );
    },
  };

  /* searchProduct
  -------------------------------------------------------------------------------------*/

  const $searchInput = $('#input-search-products');
  const $productContainer = $('#contenedor-productos-encontrados');
  let typingTimer;

  $(document).ready(function() {

    // Evento para detectar cuando el usuario está escribiendo
    $searchInput.on('input', function() {
      clearTimeout(typingTimer);
      typingTimer = setTimeout(() => {
        if($searchInput.val().length === 0){
          $productContainer.empty().removeClass('d-flex pt-4 pb-1').addClass('d-none');
          return;
        }
        mostrarProductoNuevo($searchInput.val());
      }, 1000);
    });

    /*
    $searchInput.on('blur', function() {
        $productContainer.empty().removeClass('d-flex').addClass('d-none');
    });*/
  });

  function mostrarProductoNuevo(productoNombre) {
    const urlImagenesProductos = 'http://104.218.48.244:8080/apirest/api/productos/images-propiedad-detalle/';
    const precioMinimo = '0';
    const precioMaximo = '1000';

    $.ajax({
      type: "GET",
      url: '/producto/obtenerProductosPorNombreProducto',
      dataType: "json",
      data: {
        productoNombre: productoNombre,
        minPrecio: parseFloat(precioMinimo),
        maxPrecio: parseFloat(precioMaximo)
      },
      success: function(response) {
        const productos = response.content;
        console.log(productos);

        $productContainer.empty().removeClass('d-none').addClass('d-flex py-4 pb-1');

        if(productos.length === 0){
          const mensaje = $("<p>").text("No se encontraron resultados")
          $productContainer.append(mensaje);
          return;
        }

        productos.forEach(element => {
          const productItem = $("<div>").addClass("tf-loop-item").append(
              $("<div>").addClass("image").append(
                  $("<a>").append(
                      $("<img>").attr({
                        "src": urlImagenesProductos + element.imagen,
                        "alt": element.nombre
                      })
                  )
              ),
              $("<div>").addClass("content").append(
                  $("<a>").addClass("d-block").text(element.nombre),
                  $("<a>").addClass("d-block").text(element.variacion),
                  $("<div>").addClass("tf-product-info-price").append(
                      $("<div>").addClass("compare-at-price").text(parseFloat(element.precio).toFixed(2)),
                      $("<div>").addClass("price-on-sale fw-6").text(parseFloat(element.precioReducido).toFixed(2))
                  )
              )
          );
          $productContainer.append(productItem);
        });
      },
      error: function() {
        console.log('Error al obtener el productos');
      }
    });
  }

  /* selectImages
  -------------------------------------------------------------------------------------*/
  var selectImages = function () {
    if ($(".image-select").length > 0) {
      const selectIMG = $(".image-select");
      selectIMG.find("option").each((idx, elem) => {
        const selectOption = $(elem);
        const imgURL = selectOption.attr("data-thumbnail");
        if (imgURL) {
          selectOption.attr(
            "data-content",
            "<img src='%i'/> %s"
              .replace(/%i/, imgURL)
              .replace(/%s/, selectOption.text())
          );
        }
      });
      selectIMG.selectpicker();
    }
  };

  /* preloader
  -------------------------------------------------------------------------------------*/
  const preloader = function () {
    if ($("body").hasClass("preload-wrapper")) {
      setTimeout(function () {
        $(".preload").fadeOut("slow", function () {
          $(this).remove();
        });
      }, 100);
    }
    
  };

  /* Scroll process
  -------------------------------------------------------------------------------------*/
  var scrollProgress = function () {
    $(".scroll-snap").on("scroll", function () {
      var val = $(this).scrollLeft();
      $(".value-process").css("width", `max(30%,${val}%)`);
    });
  };

  /* Button Quantity
  -------------------------------------------------------------------------------------*/
  /*var btnQuantity = function () {
    $(".minus-btn").on("click", function (e) {
      e.preventDefault();
      var $this = $(this);
      var $input = $this.closest("div").find("input");
      var value = parseInt($input.val());

      if (value > 1) {
        value = value - 1;
      }
      $input.val(value);
    });

    $(".plus-btn").on("click", function (e) {
      e.preventDefault();
      var $this = $(this);
      var $input = $this.closest("div").find("input");
      var value = parseInt($input.val());

      if (value > -1) {
        value = value + 1;
      }
      $input.val(value);
    });
  };*/

/*
  var btnQuantityCart = function () {
    // Suponiendo que tienes el carrito en localStorage
    let carrito = JSON.parse(localStorage.getItem("carrito")) || [];

    // Función para actualizar la cantidad de un producto en el carrito
    function actualizarCantidadProducto(productoPropiedadDetalleId, nuevaCantidad) {
      // Buscar el producto en el carrito
      carrito = carrito.map(item => {
        // Si el producto coincide con el ID, actualizar la cantidad
        if (item.producto.productoPropiedadDetalleId === productoPropiedadDetalleId) {
          item.cantidad = nuevaCantidad;
        }
        return item;
      });

      // Guardar el carrito actualizado en localStorage
      localStorage.setItem("carrito", JSON.stringify(carrito));
    }
    // Usar delegación de eventos para elementos generados dinámicamente
    $(document).on("click", "#shoppingCart .minus-btn", function (e) {
      e.preventDefault();
      var $this = $(this);
      let productoPropiedadDetalleId = $(this).data("ppd-id");
      var $input = $this.closest("div").find("input");
      var value = parseInt($input.val());

      if (value > 1) {
        value = value - 1;
        $input.val(value);
        actualizarCantidadProducto(productoPropiedadDetalleId, value)
      }
    });

    $(document).on("click", "#shoppingCart .plus-btn", function (e) {
      e.preventDefault();
      var $this = $(this);
      let productoPropiedadDetalleId = $(this).data("ppd-id");
      console.log(productoPropiedadDetalleId)
      var $input = $this.closest("div").find("input");
      var value = parseInt($input.val());

      if (value > -1) {
        value = value + 1;
        $input.val(value);
        actualizarCantidadProducto(productoPropiedadDetalleId, value)
      }
    });
  };

*/

  /* Delete file 
  -------------------------------------------------------------------------------------*/
  var delete_file = function (e) {
    $(".remove").on("click", function (e) {
      e.preventDefault();
      var $this = $(this);
      $this.closest(".file-delete").remove();
    });
  };

  /* Go Top
  -------------------------------------------------------------------------------------*/
  var goTop = function () {
    if ($("div").hasClass("progress-wrap")) {
      var progressPath = document.querySelector(".progress-wrap path");
      var pathLength = progressPath.getTotalLength();
      progressPath.style.transition = progressPath.style.WebkitTransition =
        "none";
      progressPath.style.strokeDasharray = pathLength + " " + pathLength;
      progressPath.style.strokeDashoffset = pathLength;
      progressPath.getBoundingClientRect();
      progressPath.style.transition = progressPath.style.WebkitTransition =
        "stroke-dashoffset 10ms linear";
      var updateprogress = function () {
        var scroll = $(window).scrollTop();
        var height = $(document).height() - $(window).height();
        var progress = pathLength - (scroll * pathLength) / height;
        progressPath.style.strokeDashoffset = progress;
      };
      updateprogress();
      $(window).scroll(updateprogress);
      var offset = 200;
      var duration = 0;
      jQuery(window).on("scroll", function () {
        if (jQuery(this).scrollTop() > offset) {
          jQuery(".progress-wrap").addClass("active-progress");
        } else {
          jQuery(".progress-wrap").removeClass("active-progress");
        }
      });
      jQuery(".progress-wrap").on("click", function (event) {
        event.preventDefault();
        jQuery("html, body").animate({ scrollTop: 0 }, duration);
        return false;
      });
    }
  };

  /* color swatch product
  -------------------------------------------------------------------------*/
  var swatchColor = function () {
    if ($(".card-product").length > 0) {
      $(".color-swatch").on("click, mouseover", function () {
        var swatchColor = $(this).find("img").attr("src");
        var imgProduct = $(this).closest(".card-product").find(".img-product");
        imgProduct.attr("src", swatchColor);
        $(this)
          .closest(".card-product")
          .find(".color-swatch.active")
          .removeClass("active");

        $(this).addClass("active");
      });
    }
  };

  /* change value
  ------------------------------------------------------------------------------------- */
  var changeValue = function () {
    if ($(".tf-dropdown-sort").length > 0) {
      $(".select-item").click(function (event) {
        $(this)
          .closest(".tf-dropdown-sort")
          .find(".text-sort-value")
          .text($(this).find(".text-value-item").text());

        $(this)
          .closest(".dropdown-menu")
          .find(".select-item.active")
          .removeClass("active");

        $(this).addClass("active");
      });
    }
  };

  /* footer accordion
  -------------------------------------------------------------------------*/
  var footer = function () {
    var args = { duration: 250 };
    $(".footer-heading-moblie").on("click", function () {
      $(this).parent(".footer-col-block").toggleClass("open");
      if (!$(this).parent(".footer-col-block").is(".open")) {
        $(this).next().slideUp(args);
      } else {
        $(this).next().slideDown(args);
      }
    });
  };

  /* close announcement bar
  -------------------------------------------------------------------------*/
  var closeAnnouncement = function () {
    $(".close-announcement-bar").on("click", function (e) {
      e.preventDefault();
      var $this = $(this);
      var $height = $(".announcement-bar").height() + "px";
      $this.closest(".announcement-bar").css("margin-top", `-${$height}`);

      $(".announcement-bar").fadeOut("slow", function () {
        $this.closest(".announcement-bar").remove();
      });
    });
  };

  /* range
  -------------------------------------------------------------------------*/
  var rangePrice = function(){
    const rangeInput = document.querySelectorAll('.range-input input')
    const progress = document.querySelector('.progress-price')
    const minPrice = document.querySelector('.min-price')
    const maxPrice = document.querySelector('.max-price')

    let priceGap = 10
    let timer // Variable para el temporizador

    rangeInput.forEach(input => {
        input.addEventListener('input', e => {
          let minValue = parseInt(rangeInput[0].value, 10)
          let maxValue = parseInt(rangeInput[1].value, 10)

          if (maxValue - minValue < priceGap) {
              if (e.target.class === 'range-min') {
                  rangeInput[0].value = maxValue - priceGap
              } else {
                  rangeInput[1].value = minValue + priceGap
              }
          } else {
              progress.style.left = (minValue / rangeInput[0].max) * 100 + "%";
              progress.style.right = 100 - (maxValue / rangeInput[1].max) * 100 + "%";
          }

          minPrice.innerHTML = minValue
          maxPrice.innerHTML = maxValue

          if (minValue >= 290) {
              minPrice.innerHTML = 290
          }

          if (maxValue <= 10) {
              maxPrice.innerHTML = 10
          }

          // Limpiar cualquier temporizador anterior
          clearTimeout(timer)

          // Esperar 2 segundos y luego mostrar los valores en el console.log
          timer = setTimeout(() => {
            console.log(`Min Price: ${minPrice.innerHTML}, Max Price: ${maxPrice.innerHTML}`)
            console.log(`Min Price: ${minPrice.innerHTML}, Max Price: ${maxPrice.innerHTML}`)
          }, 2000) // 2000 ms = 2 segundos
        })
    })

  }

  /* sidebar mobile
  -------------------------------------------------------------------------*/
  var sidebar_mb = function () {
    if ($(".wrap-sidebar-mobile").length > 0) {
      var sidebar = $(".wrap-sidebar-mobile").html();
      $(".sidebar-mobile-append").append(sidebar);
      // $(".wrap-sidebar-mobile").remove();
    }
  };

  /* tabs
  -------------------------------------------------------------------------*/
  var tabs = function () {
    $(".widget-tabs").each(function () {
      $(this)
        .find(".widget-menu-tab")
        .children(".item-title")
        .on("click", function () {
          var liActive = $(this).index();
          var contentActive = $(this)
            .siblings()
            .removeClass("active")
            .parents(".widget-tabs")
            .find(".widget-content-tab")
            .children()
            .eq(liActive);
          contentActive.addClass("active").fadeIn("slow");
          contentActive.siblings().removeClass("active");
          $(this)
            .addClass("active")
            .parents(".widget-tabs")
            .find(".widget-content-tab")
            .children()
            .eq(liActive);
        });
    });
  };

  /* flatAccordion
  -------------------------------------------------------------------------*/
  var flatAccordion = function (class1, class2) {
    var args = { duration: 200 };

    $(class2 + " .toggle-title.active")
      .siblings(".toggle-content")
      .show();
    $(class1 + " .toggle-title").on("click", function () {
      $(class1 + " " + class2).removeClass("active");
      $(this).closest(class2).toggleClass("active");

      if (!$(this).is(".active")) {
        // $(this)
        //   .closest(class1)
        //   .find(".toggle-title.active")
        //   .toggleClass("active")
        //   .next()
        //   .slideToggle(args);
        $(this).toggleClass("active");
        $(this).next().slideToggle(args);
      } else {
        $(class1 + " " + class2).removeClass("active");
        $(this).toggleClass("active");
        $(this).next().slideToggle(args);
      }
    });
  };

  /* button wishlist
  -------------------------------------------------------------------------*/
  var btn_wishlist = function () {
    if ($(".btn-icon-action").length) {
      $(".btn-icon-action").on("click", function (e) {
        $(this).toggleClass("active");
      });
    }
  };

  /* button loading
  -------------------------------------------------------------------------*/
  var btn_loading = function () {
    if ($(".tf-btn-loading").length) {
      $(".tf-btn-loading").on("click", function (e) {
        $(this).addClass("loading");
        var $this = $(this);
        setTimeout(function () {
          $this.removeClass("loading");
        }, 600);
      });
    }
  };

  /* variant picker
  -------------------------------------------------------------------------*/
  var variant_picker = function () {

/*
    if ($(".variant-picker-item").length) {
      $(".variant-picker-item label").on("click", function (e) {
        $(this)
          .closest(".variant-picker-item")
          .find(".variant-picker-label-value")
          .text($(this).data("value"));
      });
    }
*/
/*
    if ($(".variant-picker-item").length) {
      // Controlador de eventos para los inputs de tipo radio
      $(".variant-picker-item input[type='radio']").on("change", function (e) {
        // Obtener el valor seleccionado del radio button
        var selectedValue = $(this).val();
        var selectedLabel = $(this).closest(".variant-picker-values").find("label[for='" + $(this).attr("id") + "'] p").text();

        // Actualizar el texto de la etiqueta de variación
        $(this).closest(".variant-picker-item")
            .find(".variant-picker-label-value")
            .text(selectedLabel);

        // Mostrar en el console.log el valor seleccionado y su etiqueta
        console.log("Selected Value:", selectedValue);
        console.log("Selected Label:", selectedLabel);
      });
    }
    */

// Crear un objeto para almacenar las selecciones
    var selectedVariants = {};

// Inicializar el evento de selección de inputs tipo radio
    if ($(".variant-picker-item").length) {
      $(".variant-picker-item input[type='radio']").on("change", function (e) {
        // Obtener el ID de la propiedad (idPropiedad) desde el atributo 'name'
        var propiedadId = $(this).attr('name').split('-')[1]; // Extrae el ID de la propiedad del 'name'
        var selectedValue = $(this).val();
        var selectedLabel = $(this).closest(".variant-picker-values").find("label[for='" + $(this).attr("id") + "'] p").text();

        // Actualizar la etiqueta de la variación en la vista
        $(this).closest(".variant-picker-item")
            .find(".variant-picker-label-value")
            .text(selectedLabel);

        // Almacenar la selección en el objeto selectedVariants
        selectedVariants[propiedadId] = {
          value: selectedValue,
          label: selectedLabel
        };

        // Verificar si todos los inputs han sido seleccionados
        var allSelected = true;
        $(".variant-picker-item").each(function () {
          // Verificar si hay algún input seleccionado en este bloque de variación
          var radioChecked = $(this).find('input[type="radio"]:checked');
          var propiedadIdCheck = $(this).find('input[type="radio"]').attr('name').split('-')[1];

          // Si no hay un input seleccionado, marcar allSelected como falso
          if (radioChecked.length === 0) {
            allSelected = false;
            console.log("No se seleccionó una opción en propiedadIdCheck: " + propiedadIdCheck);
          }
        });

        // Si todos los inputs han sido seleccionados, mostrar en el console.log
        if (allSelected) {
          console.log("All Variants Selected:", selectedVariants);
        }
      });
    }

  };

  /* switch layout
  -------------------------------------------------------------------------*/
  var switchLayout = function () {
    if ($(".tf-control-layout").length > 0) {
      $(".tf-view-layout-switch").on("click", function () {
        var value = $(this).data("value-grid");
        $(".grid-layout").attr("data-grid", value);
        $(this)
          .closest(".tf-control-layout")
          .find(".tf-view-layout-switch.active")
          .removeClass("active");

        $(this).addClass("active");
      });
      if (matchMedia("only screen and (max-width: 1150px)").matches) {
        $(".tf-view-layout-switch.active").removeClass("active");
        $(".sw-layout-3").addClass("active");
      }
      if (matchMedia("only screen and (max-width: 768px)").matches) {
        $(".tf-view-layout-switch.active").removeClass("active");
        $(".sw-layout-2").addClass("active");
      }
    }
  };

  /* item checkbox
  -------------------------------------------------------------------------*/
  var item_checkox = function () {
    if ($(".item-has-checkox").length) {
      $(".item-has-checkox input:checkbox").on("click", function (e) {
        $(this).closest(".item-has-checkox").toggleClass("check");
      });
    }
  };

  /* infinite scroll
  -------------------------------------------------------------------------*/
  var infiniteScroll = function () {
    $(".fl-item").slice(0, 8).show();
    $(".fl-item2").slice(0, 8).show();
    $(".fl-item3").slice(0, 8).show();

    if ($(".scroll-loadmore").length > 0) {
      $(window).scroll(function () {
        if (
          $(window).scrollTop() >=
          $(document).height() - $(window).height()
        ) {
          setTimeout(() => {
            $(".fl-item:hidden").slice(0, 4).show();
            if ($(".fl-item:hidden").length == 0) {
              $(".view-more-button").hide();
            }
          }, 0);
        }
      });
    }
    if ($(".loadmore-item").length > 0) {
      $(".btn-loadmore").on("click", function () {
        setTimeout(() => {
          $(".fl-item:hidden").slice(0, 4).show();
          if ($(".fl-item:hidden").length == 0) {
            $(".view-more-button").hide();
          }
        }, 600);
      });
    }
    if ($(".loadmore-item2").length > 0) {
      $(".btn-loadmore2").on("click", function () {
        setTimeout(() => {
          $(".fl-item2:hidden").slice(0, 4).show();
          if ($(".fl-item2:hidden").length == 0) {
            $(".view-more-button2").hide();
          }
        }, 600);
      });
    }
    if ($(".loadmore-item3").length > 0) {
      $(".btn-loadmore3").on("click", function () {
        setTimeout(() => {
          $(".fl-item3:hidden").slice(0, 4).show();
          if ($(".fl-item3:hidden").length == 0) {
            $(".view-more-button3").hide();
          }
        }, 600);
      });
    }
  };
  /* stagger wrap
  -------------------------------------------------------------------------*/
  var stagger_wrap = function () {
    if ($(".stagger-wrap").length) {
      var count = $(".stagger-item").length;
      // $(".stagger-item").addClass("stagger-finished");
      for (var i = 1, time = 0.2; i <= count; i++) {
        $(".stagger-item:nth-child(" + i + ")")
          .css("transition-delay", time * i + "s")
          .addClass("stagger-finished");
      }
    }
  };

  /* filter
  -------------------------------------------------------------------------*/
  var filterTab = function () {
    var $btnFilter = $('.tf-btns-filter').click(function() {
      if (this.id == 'all') {
        $('#parent > div').show();
      } else {
        var $el = $('.' + this.id).show();
        $('#parent > div').not($el).hide();
      }
      $btnFilter.removeClass('is--active');
      $(this).addClass('is--active');
    })
  };

  /* modal second
  -------------------------------------------------------------------------*/
  var clickModalSecond = function () {
    $(".btn-choose-size").click(function () {
      $("#find_size").modal("show");
    });
    $(".btn-show-quickview").click(function () {
      $("#quick_view").modal("show");
    });
    $(".btn-add-to-cart").click(function () {
      $("#shoppingCart").modal("show");
    });

    $(".btn-add-note").click(function () {
      $(".add-note").addClass("open");
    });
    $(".btn-add-gift").click(function () {
      $(".add-gift").addClass("open");
    });
    $(".btn-estimate-shipping").click(function () {
      $(".estimate-shipping").addClass("open");
    });
    $(".tf-mini-cart-tool-close ,.tf-mini-cart-tool-close .overplay").click(
      function () {
        $(".tf-mini-cart-tool-openable").removeClass("open");
      }
    );
  };

  /* header sticky
  -------------------------------------------------------------------------*/
  var headerSticky = function () {
    let didScroll;
    let lastScrollTop = 0;
    let delta = 5;
    let navbarHeight = $("header").outerHeight();
    $(window).scroll(function (event) {
      didScroll = true;
    });
    
    setInterval(function () {
      if (didScroll) {
        let st = $(this).scrollTop();

        // Make scroll more than delta
        if (Math.abs(lastScrollTop - st) <= delta) return;
        // If scrolled down and past the navbar, add class .nav-up.
        if (st > lastScrollTop && st > navbarHeight) {
          // Scroll Down
          $("header").css("top",`-${navbarHeight}px`)
        } else {
          // Scroll Up
          if (st + $(window).height() < $(document).height()) {
            $("header").css("top","0px");
          }
        }
        lastScrollTop = st;
        didScroll = false;
      }
    }, 250);
  };

  /* header change background
  -------------------------------------------------------------------------*/
  var headerChangeBg = function () {
    $(window).on("scroll", function () {
      if ($(window).scrollTop() > 100) {
        $("header").addClass("header-bg");
      } else {
        $("header").removeClass("header-bg");
      }
    });
  }
   /* img group
  -------------------------------------------------------------------------*/
  var img_group = function () {
    if ($(".filter-images-group").length) {
      var number = $(".images-group-item").length;
      if ($(".filter-images-group").length)
      var btn_first = $(".images-group-btn-first").data("images-group");
      for (let i = 1; i <= number; i++) {
        var images_group_item = $(".filter-images-group").find(".images-group-item:nth-child(" + i + ")").data("value");
        if (images_group_item===btn_first) {
          $(".filter-images-group").find(".images-group-item:nth-child(" + i + ")").addClass("active").removeClass("hidden")
        } else (
          $(".filter-images-group").find(".images-group-item:nth-child(" + i + ")").addClass("hidden").removeClass("active")
        )
      }
      $(".images-group-btn").on("click", function () {
        var images_group_btn = $(this).data("images-group");
        for (let i = 1; i <= number; i++) {
          var images_group_item = $(".filter-images-group").find(".images-group-item:nth-child(" + i + ")").data("value");
          if (images_group_item===images_group_btn) {
            $(".filter-images-group").find(".images-group-item:nth-child(" + i + ")").addClass("active").removeClass("hidden")
          } else (
            $(".filter-images-group").find(".images-group-item:nth-child(" + i + ")").addClass("hidden").removeClass("active")
          )
        }
      });
    }

  };

  /* contact form
  ------------------------------------------------------------------------------------- */
  var ajaxContactForm = function () {
    $("#contactform").each(function () {
      $(this).validate({
        submitHandler: function (form) {
          var $form = $(form),
            str = $form.serialize(),
            loading = $("<div />", { class: "loading" });

          $.ajax({
            type: "POST",
            url: $form.attr("action"),
            data: str,
            beforeSend: function () {
              $form.find(".send-wrap").append(loading);
            },
            success: function (msg) {
              var result, cls;
              if (msg == "Success") {
                result =
                  "Email Sent Successfully. Thank you, Your application is accepted - we will contact you shortly";
                cls = "msg-success";
              } else {
                result = "Error sending email.";
                cls = "msg-error";
              }
              $form.prepend(
                $("<div />", {
                  class: "flat-alert " + cls,
                  text: result,
                }).append(
                  $(
                    '<a class="close" href="#"><i class="icon icon-close2"></i></a>'
                  )
                )
              );

              $form.find(":input").not(".submit").val("");
            },
            complete: function (xhr, status, error_thrown) {
              $form.find(".loading").remove();
            },
          });
        },
      });
    }); // each contactform
  };
  
  /* subscribe mailchimp
  ------------------------------------------------------------------------------------- */
  var ajaxSubscribe = {
    obj: {
      subscribeEmail: $("#subscribe-email"),
      subscribeButton: $("#subscribe-button"),
      subscribeMsg: $("#subscribe-msg"),
      subscribeContent: $("#subscribe-content"),
      dataMailchimp: $("#subscribe-form").attr("data-mailchimp"),
      success_message:
        '<div class="notification_ok">Thank you for joining our mailing list!</div>',
      failure_message:
        '<div class="notification_error">Error! <strong>There was a problem processing your submission.</strong></div>',
      noticeError: '<div class="notification_error">{msg}</div>',
      noticeInfo: '<div class="notification_error">{msg}</div>',
      basicAction: "mail/subscribe.php",
      mailChimpAction: "mail/subscribe-mailchimp.php",
    },

    eventLoad: function () {
      var objUse = ajaxSubscribe.obj;

      $(objUse.subscribeButton).on("click", function () {
        if (window.ajaxCalling) return;
        var isMailchimp = objUse.dataMailchimp === "true";

        // if (isMailchimp) {
        //   ajaxSubscribe.ajaxCall(objUse.mailChimpAction);
        // } else {
        //   ajaxSubscribe.ajaxCall(objUse.basicAction);
        // }
        ajaxSubscribe.ajaxCall(objUse.basicAction);
      });
    },

    ajaxCall: function (action) {
      window.ajaxCalling = true;
      var objUse = ajaxSubscribe.obj;
      var messageDiv = objUse.subscribeMsg.html("").hide();
      $.ajax({
        url: action,
        type: "POST",
        dataType: "json",
        data: {
          subscribeEmail: objUse.subscribeEmail.val(),
        },
        success: function (responseData, textStatus, jqXHR) {
          if (responseData.status) {
            objUse.subscribeContent.fadeOut(500, function () {
              messageDiv.html(objUse.success_message).fadeIn(500);
            });
          } else {
            switch (responseData.msg) {
              case "email-required":
                messageDiv.html(
                  objUse.noticeError.replace(
                    "{msg}",
                    "Error! <strong>Email is required.</strong>"
                  )
                );
                break;
              case "email-err":
                messageDiv.html(
                  objUse.noticeError.replace(
                    "{msg}",
                    "Error! <strong>Email invalid.</strong>"
                  )
                );
                break;
              case "duplicate":
                messageDiv.html(
                  objUse.noticeError.replace(
                    "{msg}",
                    "Error! <strong>Email is duplicate.</strong>"
                  )
                );
                break;
              case "filewrite":
                messageDiv.html(
                  objUse.noticeInfo.replace(
                    "{msg}",
                    "Error! <strong>Mail list file is open.</strong>"
                  )
                );
                break;
              case "undefined":
                messageDiv.html(
                  objUse.noticeInfo.replace(
                    "{msg}",
                    "Error! <strong>undefined error.</strong>"
                  )
                );
                break;
              case "api-error":
                objUse.subscribeContent.fadeOut(500, function () {
                  messageDiv.html(objUse.failure_message);
                });
            }
            messageDiv.fadeIn(500);
          }
        },
        error: function (jqXHR, textStatus, errorThrown) {
          alert("Connection error");
        },
        complete: function (data) {
          window.ajaxCalling = false;
        },
      });
    },
  };

  /* auto popup
  ------------------------------------------------------------------------------------- */
  var autoPopup = function () {
    if($("body").hasClass("popup-loader")){
      if ($(".auto-popup").length > 0) {
        let showPopup = sessionStorage.getItem("showPopup");
        if (!JSON.parse(showPopup)) {
          setTimeout(function () {
            $(".auto-popup").modal('show');
          }, 3000);
        }
      }
      $(".btn-hide-popup").on("click", function () {
        sessionStorage.setItem("showPopup", true);
      });
    };

  };
  /* toggle control
  ------------------------------------------------------------------------------------- */
  var clickControl = function () {
    // var args = { duration: 500 };

    $(".btn-address").click(function () {
      $(".show-form-address").toggle();
    });
    $(".btn-hide-address").click(function () {
      $(".show-form-address").hide();
    });
    $(".btn-edit-address").click(function () {
      $(".edit-form-address").toggle();
    });
    $(".btn-hide-edit-address").click(function () {
      $(".edit-form-address").hide();
    });
  };

  // Dom Ready
  $(function () {
    selectImages();
    //btnQuantity();
    //btnQuantityCart();
    delete_file();
    goTop();
    closeAnnouncement();
    preloader();
    sidebar_mb();
    tabs();
    flatAccordion(".flat-accordion", ".flat-toggle");
    flatAccordion(".flat-accordion1", ".flat-toggle1");
    flatAccordion(".flat-accordion2", ".flat-toggle2");
    swatchColor();
    changeValue();
    footer();
    btn_wishlist();
    btn_loading();
    variant_picker();
    switchLayout();
    item_checkox();
    infiniteScroll();
    stagger_wrap();
    clickModalSecond();
    scrollProgress();
    headerSticky();
    headerChangeBg();
    img_group();
    filterTab();
    ajaxContactForm();
    ajaxSubscribe.eventLoad();
    autoPopup();
    rangePrice();
    clickControl();
    new WOW().init();
  });
})(jQuery);
