-- Code by UjEdwin

minetest.register_on_joinplayer(function(player)
if minetest.check_player_privs(player:get_player_name(), {interact=true})==false then
	local form="size[8,9;] "


--================= Add "," between the rules  ================= 
	form=form.."textlist[-0.1,-0.1;8,9;text;Server Rules ,No ask for privs or admin stuff ,No swearing or bad names ,No trolling ,No griefing ,No killing ,No stealing or steal people's usernames ,No hacking ,Don't mess up with moderators or admins, ,Do you accept the server rules?]"
--=================================================== 


	form=form.." button_exit[2,7;2,2;yes;Yes!]"
	form=form.." button[4,7;2,2;no;No]"
	minetest.show_formspec(player:get_player_name(), "AgreeRulesYesNoForm",form)
end
end)

minetest.register_on_player_receive_fields(function(player, form, pressed)
	if form== "AgreeRulesYesNoForm" then
	local name=player:get_player_name()
	local privs = minetest.get_player_privs(name)
		if pressed.yes then

--================= Privs to grant ================= 
			privs.shout = true
			privs.interact = true
			privs.home = true
--===========================================


			minetest.set_player_privs(name, privs)
			minetest.chat_send_player(name,"Welcome "..name.."! You have now permission to play!")
			minetest.chat_send_all("Everyone, please welcome "..name.." to the server!")
			return 0
		end
			minetest.kick_player(name,"You have to agree the rules to play this server. You are welcome back to next time")
	end
end)