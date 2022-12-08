function _msgsv(origen, opt, modo, thePlayer)
    local inf = "#009999[Info]#FFFFFF  "
    local err = "#DD0606[Error]#FFFFFF  "

    if origen == "gral" then  
        if opt == "err" then
            if modo == "nro" then outputChatBox(err.. "Solo podes poner números.", thePlayer, 255, 255, 255, true)
            elseif modo == "all" then outputChatBox(err.. "Rellena todos los campos.", thePlayer, 255, 255, 255, true)
            elseif modo == "some" then outputChatBox(err.. "Completa el campo.", thePlayer, 255, 255, 255, true)
            elseif modo == "sv" then outputChatBox(err.. "Hubo un error del lado del servidor. Contactate con Seyer.", thePlayer, 255, 255, 255, true)
            elseif modo == "tpveh" then outputChatBox(err.. "No podes usar el marker estando en vehículos.", thePlayer, 255, 255, 255, true)
            end
        end
    
    elseif origen == "cmd" then
        if opt == "err" then
            if modo == "user" then outputChatBox(err.. "Ingresa otro usuario.", thePlayer, 255, 255, 255, true)
            elseif modo == "send" then outputChatBox(err.. "Usa: /send [nombre] [cantidad]", thePlayer, 255, 0, 0, true)
            end
        end

    elseif origen == "bank" then
        if opt == "info" then
            if modo == "nuevaTarjeta" then outputChatBox(inf.. "Conseguiste tu tarjeta correctamente.\n"..inf.."Ahora anda a la ventanilla para hacer las operaciones!", thePlayer, 255, 255, 255, true) end
        else
            if modo == "cant" then outputChatBox(err.. "No tenes esa cantidad de dinero.", thePlayer, 255, 255, 255, true)
            elseif modo == "ya" then outputChatBox(err.. "Ya tenes una tarjeta, no podes sacar otra.", thePlayer, 255, 255, 255, true)
            elseif modo == "n/a" then outputChatBox(err.. "No tenes tarjeta. Para conseguirla anda 'Permisos y licencias'.", thePlayer, 255, 255, 255, true)
            elseif modo == "monto" then outputChatBox(err.. "La cantidad mínima a depositar es $1.", thePlayer, 255, 255, 255, true)
            elseif modo == "max" then outputChatBox(err.. "Con esa acción superas el límite de dinero.", thePlayer, 255, 255, 255, true)
            end
        end
    elseif origen == "login" then
        if opt == "info" then
            if modo == "reg" then outputChatBox(inf.. "Te registraste exitosamente.", thePlayer, 255, 255, 255, true)
            elseif modo == "logged-in" then outputChatBox(inf.. "Te logeaste correctamente.", thePlayer, 255, 255, 255, true)
            end
        else
            if modo == "serial" then outputChatBox(err.. "Esta pc ya tiene una cuenta.", thePlayer, 255, 255, 255, true)
            elseif modo == "pc" then outputChatBox(err.. "La cuenta pertenece a otra pc.", thePlayer, 255, 255, 255, true)
            elseif modo == "existe" then outputChatBox(err.. "La cuenta ya existe.", thePlayer, 255, 255, 255, true)
            elseif modo == "no" then outputChatBox(err.. "La cuenta no existe.", thePlayer, 255, 255, 255, true)
            elseif modo == "pwinv" then outputChatBox(err.. "La contraseña no es correcta.", thePlayer, 255, 255, 255, true)
            elseif modo == "on" then outputChatBox(err.. "Tenes que estar desconectado para usar este panel.", thePlayer, 255, 255, 255, true)
            end
        end
    end
end