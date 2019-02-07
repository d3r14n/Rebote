function love.load()
	contadorTierra = 0
	contadorMarte = 0
	contadorLuna = 0

	tierraX = 300
	tierraY = 100
	tierraGravedad = 9.81
	tierraImpulso = 0
	tierraCaida = tierraImpulso
	tierraMovimiento = false
	tierraRebote = true

	marteX = 200
	marteY = 100
	marteGravedad = 3.71
	marteImpulso = 0
	marteCaida = marteImpulso
	marteMovimiento = false
	marteRebote = true

	lunaX = 100
	lunaY = 100
	lunaGravedad = 1.62
	lunaImpulso = 0
	lunaCaida = lunaImpulso
	lunaMovimiento = false
	lunaRebote = true

	love.window.setMode(400, 400)
end

function love.draw()
	love.graphics.setColor(0, 0, 255)
	love.graphics.circle("fill", tierraX, tierraY, 25)
	love.graphics.setColor(255, 0, 0)
	love.graphics.circle("fill", marteX, marteY, 25)
	love.graphics.setColor(176, 176, 176)
	love.graphics.circle("fill", lunaX, lunaY, 25)
  	love.graphics.print(contadorTierra, 300, 50, 0)
  	love.graphics.print(contadorMarte, 200, 50, 0)
  	love.graphics.print(contadorLuna, 100, 50, 0)
end

function love.update(dt)

	if tierraMovimiento then
		if tierraRebote then
			tierraY = tierraY + tierraCaida
			tierraCaida = tierraCaida + tierraGravedad/60
		else
			tierraY = tierraY - tierraCaida
			tierraCaida = tierraCaida - tierraGravedad/60
  		end
  		if tierraY >= 375 then
  			tierraRebote = false
      		tierraCaida = tierraCaida * 0.75
      		if tierraY > 375 then
        		contadorTierra = contadorTierra + 1
        	end
      		if tierraCaida < 0.5 then
        		tierraMovimiento = false
        		tierraCaida = 0
        	end
  		end
  		if tierraCaida <= 0 then
      		if tierraRebote then
        		tierraMovimiento = false
        		tierraCaida = 0
      		else
        		tierraCaida = tierraGravedad/60
        		tierraRebote = true
        	end
        end
	end

	if marteMovimiento then
		if marteRebote then
			marteY = marteY + marteCaida
			marteCaida = marteCaida + marteGravedad/60
		else
			marteY = marteY - marteCaida
			marteCaida = marteCaida - marteGravedad/60
  		end
  		if marteY >= 375 then
  			marteRebote = false
      		marteCaida = marteCaida * 0.75
      		if marteY > 375 then
        		contadorMarte = contadorMarte + 1
        	end
      		if marteCaida < 0.25 then
        		marteMovimiento = false
        		marteCaida = 0
        	end
  		end
  		if marteCaida <= 0 then
      		if marteRebote then
        		marteMovimiento = false
        		marteCaida = 0
      		else
        		marteCaida = marteGravedad/60
        		marteRebote = true
        	end
        end
	end

	if lunaMovimiento then
		if lunaRebote then
			lunaY = lunaY + lunaCaida
			lunaCaida = lunaCaida + lunaGravedad/60
		else
			lunaY = lunaY - lunaCaida
			lunaCaida = lunaCaida - lunaGravedad/60
  		end
  		if lunaY >= 375 then
  			lunaRebote = false
      		lunaCaida = lunaCaida * 0.75
      		if lunaY > 375 then
        		contadorLuna = contadorLuna + 1
        	end
      		if lunaCaida < 0.25 then
        		lunaMovimiento = false
        		lunaCaida = 0
        	end
  		end
  		if lunaCaida <= 0 then
      		if lunaRebote then
        		lunaMovimiento = false
        		lunaCaida = 0
      		else
        		lunaCaida = marteGravedad/60
        		lunaRebote = true
        	end
        end
	end

end

function love.mousepressed(x, y, button)
 	if not tierraMovimiento and not marteMovimiento and not lunaMovimiento then
		contadorTierra = 0
    	tierraX = 300
    	tierraY = 100
    	tierraMovimiento = true

    	contadorMarte = 0
    	marteX = 200
    	marteY = 100
    	marteMovimiento = true

    	contadorLuna = 0
    	lunaX = 100
    	lunaY = 100
    	lunaMovimiento = true
    end
end

--love.touchpressed(id, x, y, dx, dy, pressure)
--love.mousepressed( x, y, button )