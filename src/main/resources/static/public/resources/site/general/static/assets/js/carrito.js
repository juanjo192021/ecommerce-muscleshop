$(document).ready(function () {

    cantidadCarrito();
    mostrarCarrito();

    $("#login").on("show.bs.modal", function() {
        // Guarda la URL actual en localStorage
        localStorage.setItem("prevURL", window.location.href);
    });


    // Usar delegación de eventos para elementos generados dinámicamente
    $(document).on("click", ".minus-btn", function (e) {
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

    //Cuando se da click al btn aumentar la cantidad de los productos
    $(document).on("click", ".plus-btn", function (e) {
        e.preventDefault();
        let $this = $(this);
        let productoPropiedadDetalleId = $(this).data("ppd-id");
        console.log({productoPropiedadDetalleIdPlus : productoPropiedadDetalleId})
        let $input = $this.closest("div").find("input");
        let value = parseInt($input.val());

        if (value > -1) {
            value = value + 1;
            $input.val(value);
            actualizarCantidadProducto(productoPropiedadDetalleId, value)
        }
    });

    // Evento click para el modal #quick_add
    $(document).on("click", ".btn-show-detail", function () {
        producto = $(this).data("producto");

        variacionesParams = producto.variaciones.map(function (v, i) {
            return 'variacion' + (i + 1) + '=' + encodeURIComponent(v.trim());
        }).join('&');

        const preciosDefecto = { regular: producto.precio, especial: producto.precioReducido, labelEspecial: "Precio Reducido:" };
        const preciosPorRol = {
            "Cliente": { regular: producto.precio, especial: producto.precioReducido, labelEspecial: "Precio Reducido:" },
            "Team": { regular: producto.precio, especial: producto.precioTeam, labelEspecial: "Precio Team:" },
            "Team Vip": { regular: producto.precio, especial: producto.precioTeamVip, labelEspecial: "Precio VIP Team:" },
            "Familiar": { regular: producto.precio, especial: producto.precioTeamVip, labelEspecial: "Precio VIP Team:" }
        };

        const precio = (dataUsuario && dataUsuario.nombreRolPerfil) ? preciosPorRol[dataUsuario.nombreRolPerfil] : preciosDefecto;

        $("#quick_add .image img").attr({"src": urlImagenesProductos +producto.imagen});
        $("#quick_add .content a").text(producto.nombre);
        $("#quick_add .content a").attr("href", "/"+producto.urlMenu+"/"+producto.urlMenuSub+"/"+producto.urlCategoria+"/"+producto.urlProducto + "?" + variacionesParams);
        $("#quick_add .tf-product-info-price .price-on-sale").text("S/. " + parseFloat(precio.especial).toFixed(2));
        $("#quick_add .tf-product-info-price .compare-at-price").text("S/. " + parseFloat(precio.regular).toFixed(2));

        $.ajax({
            type: "GET",
            url: '/qaweb/producto/obtenerVariaciones',
            dataType: "json",
            data: { productoId: producto.id },
            success: function (response) {
                const variaciones = response;
                const $variantPicker = $("#quick_add .tf-product-info-variant-picker");

                $variantPicker.empty();

                $.each(variaciones, function (i, variacion) {
                    let $variantItem = $("<div>").addClass("variant-picker-item");
                    let $variantLabel = $("<div>").addClass("variant-picker-label").text(variacion.nombreVariacion);
                    let $variantValues = $("<div>").addClass("variant-picker-values");

                    $.each(variacion.atributosDto, function (j, atributo) {
                        let isChecked = producto.variaciones.includes(atributo.nombreAtributo);
                        $variantValues.append(
                            $("<input>").attr({
                                type: "radio",
                                name: "name-" + variacion.idPropiedad,
                                id: "values-" + atributo.nombreAtributo,
                                value: atributo.nombreAtributo,
                                checked: isChecked
                            }),
                            $("<label>").addClass("style-text").attr({
                                for: "values-" + atributo.nombreAtributo,
                                "data-value": atributo.nombreAtributo
                            }).append($("<p>").text(atributo.nombreAtributo))
                        );
                    });

                    $variantItem.append($variantLabel).append($variantValues);
                    $variantPicker.append($variantItem);
                });

                $(document).on("change", ".variant-picker-item input[type='radio']", function() {
                    updateSelectedVariants();
                    buscarPresentacionPorProductoIdAndValorVariaciones(producto.id, selectedVariants);
                });
            },
            error: function () {
                console.log('Error al obtener variaciones del producto');
            }
        });
    });

    $(document).on("click", ".btn-add-shopping-cart", function() {
        let carrito = JSON.parse(localStorage.getItem("carrito")) || [];
        let cantidad = $(".wg-quantity .cantidad-producto-preview").val();

        let productoExistente = carrito.find(item => item.producto.productoPropiedadDetalleId === producto.productoPropiedadDetalleId);
        if (productoExistente) {
            productoExistente.cantidad += parseInt(cantidad);
        } else {
            carrito.push({ producto, cantidad: parseInt(cantidad) });
        }

        localStorage.setItem("carrito", JSON.stringify(carrito));
        cantidadCarrito();
    });

    $(document).on("click", "#btn-shopping-cart",function () {
        mostrarCarrito();
    })
});

function cantidadCarrito(){

    let carrito = JSON.parse(localStorage.getItem("carrito")) || [];
    let cantidad = carrito.length ? carrito.length : 0;
    $('#btn-shopping-cart .count-box').text(cantidad);

}

function buscarPresentacionPorProductoIdAndValorVariaciones(productoId, variaciones){
    let variacionesStr = variaciones.join(',');
    $.ajax({
        type: "GET",
        url: '/qaweb/productoPropiedadesDetalles/buscarPorProductoIdAndVariaciones',
        dataType: "json",
        data: { productoId: parseInt(productoId), variaciones: variacionesStr },
        success: function (response) {
            console.log({buscarPorProductoIdAndVariaciones:response})
            variacionesParams = variaciones.map(function (v, i) {
                return 'variacion' + (i + 1) + '=' + encodeURIComponent(v.trim());
            }).join('&');

            producto.imagen = response.imagen
            producto.skuProductoPropiedadesDetalles= response.skuProductoPropiedadesDetalles
            producto.stock = response.stock
            producto.precio = response.precio;
            producto.precioReducido = response.precioReducido
            producto.precioTeam = response.precioTeam
            producto.precioTeamVip = response.precioTeamVip
            producto.precioFamiliar = response.precioFamiliar
            producto.variacion = variaciones.join(' ');
            producto.variaciones = variaciones

            console.log({productoFinal : producto})

            const preciosDefecto = { regular: response.precio, especial: response.precioReducido, labelEspecial: "Precio Reducido:" };

            const preciosPorRol = {
                "Cliente": { regular: response.precio, especial: response.precioReducido, labelEspecial: "Precio Reducido:" },
                "Team": { regular: response.precio, especial: response.precioTeam, labelEspecial: "Precio Team:" },
                "Team Vip": { regular: response.precio, especial: response.precioTeamVip, labelEspecial: "Precio VIP Team:" },
                "Familiar": { regular: response.precio, especial: response.precioFamiliar, labelEspecial: "Precio VIP Team:" }
            };

            const precio = (dataUsuario && dataUsuario.nombreRolPerfil) ? preciosPorRol[dataUsuario.nombreRolPerfil] : preciosDefecto

            $("#quick_add .image img").attr({"src" :urlImagenesProductos +response.imagen});
            $("#quick_add .content a").attr("href", "/qaweb/"+producto.urlMenu+"/"+producto.urlMenuSub+"/"+producto.urlCategoria+"/"+producto.urlProducto + "?" + variacionesParams);
            $('#quick_add .tf-product-info-price .price-on-sale').text(`S/. ${parseFloat(precio.especial).toFixed(2)}`);
            $('#quick_add .tf-product-info-price .compare-at-price').text(`S/. ${parseFloat(precio.regular).toFixed(2)}`);

            $('.icon-bag .count-box').text('15')
        },
        error: function() {
            console.log('Error al obtener producto');
        }
    });
}

function updateSelectedVariants() {
    selectedVariants = [];

    $(".variant-picker-item").each(function () {
        var selectedRadio = $(this).find('input[type="radio"]:checked');
        if (selectedRadio.length > 0) {

            var selectedValue = selectedRadio.val().trim();
            if (selectedValue && selectedValue !== 'on') {
                selectedVariants.push(selectedValue);
            }
        }
    });
}

function actualizarCantidadProducto(productoPropiedadDetalleId, nuevaCantidad) {
    let carrito = JSON.parse(localStorage.getItem("carrito")) || [];
    let subtotal = 0;
    carrito = carrito.map((item,index) => {

        let calculo = 0;
        if (item.producto.productoPropiedadDetalleId === productoPropiedadDetalleId) {
            item.cantidad = nuevaCantidad;
        }

        const preciosDefecto = { regular: item.producto.precio, especial: item.producto.precioReducido };
        const preciosPorRol = {
            "Cliente": { regular: item.producto.precio, especial: item.producto.precioReducido },
            "Team": { regular: item.producto.precio, especial: item.producto.precioTeam },
            "Team Vip": { regular: item.producto.precio, especial: item.producto.precioTeamVip },
            "Familiar": { regular: item.producto.precio, especial: item.producto.precioFamiliar }
        };
        const precioSeleccionado = dataUsuario && dataUsuario.nombreRolPerfil ? preciosPorRol[dataUsuario.nombreRolPerfil] : preciosDefecto;
        calculo = precioSeleccionado.especial * item.cantidad;

        $(`.cart-total-${index}`).text(`S/. ${calculo.toFixed(2)}`);

        // Calcular el subtotal de este producto y añadirlo al total
        subtotal += calculo;

        return item;
    });

    localStorage.setItem("carrito", JSON.stringify(carrito));
    $(".tf-totals-total-value").text(`S/. ${subtotal.toFixed(2)}`);
    $(".total-value").text(`S/. ${subtotal.toFixed(2)}`);
}

function mostrarCarrito(){
    $("#contenedor-productos-carrito").html("");
    let carrito = JSON.parse(localStorage.getItem("carrito")) || [];
    let subtotal = 0;
    carrito.forEach((item,index) => {

        variacionesParams = item.producto.variaciones.map(function (v, i) {
            return 'variacion' + (i + 1) + '=' + encodeURIComponent(v.trim());
        }).join('&');

        let cartItem = $("<div>").addClass("tf-mini-cart-item");

        let cartImage = $("<div>").addClass("tf-mini-cart-image").append(
            $("<a>").attr({
                "href": "/qaweb/"+item.producto.urlMenu+"/" + item.producto.urlMenuSub+ "/" + item.producto.urlCategoria+"/"+
                    item.producto.urlProducto+"?"+variacionesParams,
            }).append(
                $("<img>").attr({"src": urlImagenesProductos + item.producto.imagen}).attr("alt", item.producto.nombre)
            )
        );

        const preciosDefecto = { regular: item.producto.precio, especial: item.producto.precioReducido, labelEspecial: "Precio Reducido:" };

        const preciosPorRol = {
            "Cliente": { regular: item.producto.precio, especial: item.producto.precioReducido, labelEspecial: "Precio Reducido:" },
            "Team": { regular: item.producto.precio, especial: item.producto.precioTeam, labelEspecial: "Precio Team:" },
            "Team Vip": { regular: item.producto.precio, especial: item.producto.precioTeamVip, labelEspecial: "Precio VIP Team:" },
            "Familiar": { regular: item.producto.precio, especial: item.producto.precioFamiliar, labelEspecial: "Precio VIP Team:" }
        };

        const precio = (dataUsuario && dataUsuario.nombreRolPerfil) ? preciosPorRol[dataUsuario.nombreRolPerfil] : preciosDefecto;
        subtotal += precio.especial * item.cantidad;

        let cartInfo = $("<div>").addClass("tf-mini-cart-info")
            .append(
                $("<a>").addClass("title link").attr({
                    "href": "/qaweb/"+item.producto.urlMenu+"/" + item.producto.urlMenuSub+ "/" + item.producto.urlCategoria+"/"+
                        item.producto.urlProducto+"?"+variacionesParams,
                }).text(item.producto.nombre),
                $("<div>").addClass("meta-variant").text(item.producto.variacion),
                $("<div>").addClass("price fw-6").text(`S/. ${parseFloat(precio.especial).toFixed(2)}`)
            );

        let quantityControl = $("<div>").addClass("wg-quantity small")
            .append(
                $("<span>").addClass("btn-quantity minus-btn").data("ppd-id", item.producto.productoPropiedadDetalleId).text("-"),
                $("<input>").attr({"type":"text", "name": "number", "value": item.cantidad+""}).attr("name", "number").val(item.cantidad),
                $("<span>").addClass("btn-quantity plus-btn").data("ppd-id", item.producto.productoPropiedadDetalleId).text("+")
            );

        let removeButton = $("<div>").addClass("tf-mini-cart-remove").text("Eliminar").data("index", index);
        let cartBtns = $("<div>").addClass("tf-mini-cart-btns").append(quantityControl, removeButton);

        cartInfo.append(cartBtns);
        cartItem.append(cartImage, cartInfo);
        $("#contenedor-productos-carrito").append(cartItem);
    });

    $(".tf-totals-total-value").text(`S/. ${subtotal.toFixed(2)}`);

    $(".tf-mini-cart-remove").on("click", function () {
        let index = $(this).data("index");
        carrito.splice(index, 1);
        localStorage.setItem("carrito", JSON.stringify(carrito));
        mostrarCarrito();
        cantidadCarrito();
    });
}