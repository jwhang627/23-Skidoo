extends Node

var p_scrpt = [
	{"line":"Your grandmother defined the phrase 23 Skidoo like this:","image":"res://images/23_logo.png"},
	{"line":"\"When in doubt, get the hell out of here now.\"","image":"res://images/23_logo.png"},
	{"line":"You should have considered her words on your 10th birthday.","image":"res://images/23_logo.png"},
	{"line":"You remember on that night of your 10th birthday.","image":"res://images/small_house.png"},
	{"line":"You discovered this tiny window-less building.","image":"res://images/small_house.png"},
	{"line":"You can see it from second floor, but back then you didn't realize its existence.","image":"res://images/small_house.png"},
	{"line":"You called this tiny building The Place.","image":"res://images/small_house.png"},
	{"line":"You think the ugly building doesn't deserve a pretty name.","image":"res://images/small_house.png"},
	{"line":"Your 10-year-old self, in pajama, sneaked out of the house eleven in the evening.","image":"res://images/small_house.png"},
	{"line":"You entered into the Place and saw a painted circle drawn on the concrete floor.","image":"res://images/pentagram_square_BW.jpg"},
	{"line":"Then behind you, the door of the Place shut.","image":"res://images/pentagram_square_BW.jpg"},
	{"line":"Inside you screamed for help, but only get drown out by a sudden loud sound.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"You saw one wall opened to the indescribable world.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"An extraordinary power then wrapped around you and unlocked your hidden ability.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"The birthday gift from another dimension.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"The door of the Place opened, and you walked back home feeling fatigued.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"Your parents saw you returning and called for a help.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"You then didn't feel familiar with your safest place in this world.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"Your child self couldn't reconcile with this alien feeling.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"You remember this incident where you realized this hidden ability.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"You and your childhood friends went to the woods to play the game of tag.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"When you were on the run, you fell from the cliff by mistake.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"Down until the sound of rustling tree branches reached to your friends' ears.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"At this point, your friends expected you to die from a broken neck and blood-loss.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"On the ground, you felt fine. Not even gravity could hurt you.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"The town people found you standing up.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"They were amazed how you managed to survive from the fall.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"Then you talked to the local priestess about incidents after your 10th birthday.","image":"res://images/priestess.png"},
	{"line":"She responded with a horrified facial expression.","image":"res://images/priestess.png"},
	{"line":"The priestess went to her office and brought an amulet from her table.","image":"res://images/the_amulet.png"},
	{"line":"She said to your child self that this amulet can preserve your humanity.","image":"res://images/the_amulet.png"},
	{"line":"You wanted to know more about how this amulet can protect you.","image":"res://images/the_amulet.png"},
	{"line":"You went to your grandmother, who knew much about eldritch matters.","image":"res://images/grandma.png"},
	{"line":"You told her about the portal in the Place, and how the falling didn't affect you.","image":"res://images/grandma.png"},
	{"line":"Grandmother told you that ritualists used this circle in the Place to summon demons.","image":"res://images/ritual.png"},
	{"line":"Here how they made two worlds to connect each other.","image":"res://images/opening_demonic_portal.png"},
	{"line":"You need to stand on the circle at a certain time.","image":"res://images/opening_demonic_portal.png"},
	{"line":"Eleven in the evening.","image":"res://images/opening_demonic_portal.png"},
	{"line":"She explained, that these demons wanted you to come to their world.","image":"res://images/grandma.png"},
	{"line":"They gave you this inhuman ability to give you an idea for their power.","image":"res://images/grandma.png"},
	{"line":"This amulet could fend yourself from the demons' growing influence.","image":"res://images/grandma.png"},
	{"line":"You must remind your humanity.","image":"res://images/grandma.png"},
	{"line":"From there on, you stopped being invincible.","image":"res://images/grandma.png"},
	{"line":"A week after your 23rd birthday, you decide to destruct the Place.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"You prepare by wearing the amulet, and bringing a lantern and a sledgehammer.","image":"res://images/sledgehammer.png"},
	{"line":"Like those Wormsley Common gangs, you will destroy this Place from the inside.","image":"res://images/sledgehammer.png"},
	{"line":"You start with the door, and hope that it will never lock you in again.","image":"res://images/small_house.png"},
	{"line":"You see the circle on the concrete floor.","image":"res://images/pentagram_square_BW.jpg"},
	{"line":"You swing the hammer to the ground, and the concrete floor breaks like a glass.","image":"res://images/pentagram_square_BW.jpg"},
	{"line":"You continue until the circle is gone.","image":"res://images/pentagram_square_BW.jpg"},
	{"line":"After that, you will make a hole on the wall, and expect a view from the outside.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"Then the entrance closes.","image":"res://images/black_square.png"},
	{"line":"You have 230 minutes left until something will happen.","image":"res://images/black_square.png"}
]

var game_map = {
	"init_center":{
		"type":"choice",
		"location":"center",
		"picture":"res://images/black_square.png",
		"line":"You better bring a pen and paper on this one. You are trapped in the middle of the Place. You remember what your grandmother told you about this kind of scenario, and need to do in an order of specific actions. Then you forgot about that order. You need to rely on trials and errors. But don't worry - you have a plenty of time. What do you do?",
		"option1":{
			"text":"Approach the LEFT wall.",
			"value":"init_left"
		},
		"option2":{
			"text":"Approach the FRONT wall.",
			"value":"init_front"
		},
		"option3":{
			"text":"Approach the RIGHT wall.",
			"value":"init_right"
		}
	},
	"init_left":{
		"type":"choice",
		"location":"left",
		"picture":"res://images/symbols/LEFT_wall_symbol.jpg",
		"line":"You see a LEFT wall with an unusual symbol. What do you do with this?",
		"option1":{
			"text":"Put your hand on it.",
			"value":"touch_left"
		},
		"option2":{
			"text":"Try breaking it with hammer.",
			"value":"break_left"
		},
		"option3":{
			"text":"Go back to the center.",
			"value":"normal_center"
		}
	},
	"touch_left":{
		"type":"choice",
		"location":"left",
		"picture":"res://images/symbols/LEFT_wall_symbol.jpg",
		"line":"You remember your grandmother's instruction to recite a certain ancient verse. They are in different languages. Which one would you cite?",
		"option1":{
			"text":"Germanic verse.",
			"value":"germanic_left_result"
		},
		"option2":{
			"text":"Frankish verse.",
			"value":"frankish_left_result"
		},
		"option3":{
			"text":"Forget it. Return to center.",
			"value":"normal_center"
		}
	},
	"germanic_left_result":{
		"type":"result",
		"location":"left",
		"picture":"res://images/symbols/LEFT_wall_symbol.jpg",
		"line":"You hear the rumbling sound outside. You might have done something right.",
		"option1":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option2":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option3":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"result":"germanic-left"
	},
	"frankish_left_result":{
		"type":"result",
		"location":"left",
		"picture":"res://images/symbols/LEFT_wall_symbol.jpg",
		"line":"You hear the rumbling sound outside. You might have done something right.",
		"option1":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option2":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option3":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"result":"frankish-left"
	},
	"break_left":{
		"type":"result",
		"location":"left",
		"picture":"res://images/symbols/LEFT_wall_symbol.jpg",
		"line":"You break the LEFT wall. You hear the rumbling sound outside. You might have done something right.",
		"option1":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option2":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option3":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"result":"break-left"
	},
	"init_front":{
		"type":"choice",
		"location":"front",
		"picture":"res://images/symbols/FRONT_wall_symbol.jpg",
		"line":"You see a FRONT wall with an unusual symbol. What do you do with this?",
		"option1":{
			"text":"Put your hand on it.",
			"value":"touch_front"
		},
		"option2":{
			"text":"Try breaking it with hammer.",
			"value":"break_front"
		},
		"option3":{
			"text":"Go back to the center.",
			"value":"normal_center"
		}
	},
	"touch_front":{
		"type":"choice",
		"location":"front",
		"picture":"res://images/symbols/FRONT_wall_symbol.jpg",
		"line":"You remember your grandmother's instruction to recite a certain ancient verse. They are in different languages. Which one would you cite?",
		"option1":{
			"text":"Germanic verse.",
			"value":"germanic_front_result"
		},
		"option2":{
			"text":"Frankish verse.",
			"value":"frankish_front_result"
		},
		"option3":{
			"text":"Forget it. Return to center.",
			"value":"normal_center"
		}
	},
	"germanic_front_result":{
		"type":"result",
		"location":"front",
		"picture":"res://images/symbols/FRONT_wall_symbol.jpg",
		"line":"You hear the rumbling sound outside. You might have done something right.",
		"option1":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option2":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option3":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"result":"germanic-front"
	},
	"frankish_front_result":{
		"type":"result",
		"location":"front",
		"picture":"res://images/symbols/FRONT_wall_symbol.jpg",
		"line":"You hear the rumbling sound outside. You might have done something right.",
		"option1":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option2":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option3":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"result":"frankish-front"
	},
	"break_front":{
		"type":"result",
		"location":"front",
		"picture":"res://images/symbols/FRONT_wall_symbol.jpg",
		"line":"You break the FRONT wall. You hear the rumbling sound outside. You might have done something right.",
		"option1":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option2":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option3":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"result":"break-front"
	},
	"init_right":{
		"type":"choice",
		"location":"right",
		"picture":"res://images/symbols/RIGHT_wall_symbol.jpg",
		"line":"You see a RIGHT wall with an unusual symbol. What do you do with this?",
		"option1":{
			"text":"Put your hand on it.",
			"value":"touch_right"
		},
		"option2":{
			"text":"Try breaking it with hammer.",
			"value":"break_right"
		},
		"option3":{
			"text":"Go back to the center.",
			"value":"normal_center"
		}
	},
	"touch_right":{
		"type":"choice",
		"location":"right",
		"picture":"res://images/symbols/RIGHT_wall_symbol.jpg",
		"line":"You remember your grandmother's instruction to recite a certain ancient verse. They are in different languages. Which one would you cite?",
		"option1":{
			"text":"Germanic verse.",
			"value":"germanic_right_result"
		},
		"option2":{
			"text":"Frankish verse.",
			"value":"frankish_right_result"
		},
		"option3":{
			"text":"Forget it. Return to center.",
			"value":"normal_center"
		}
	},
	"germanic_right_result":{
		"type":"result",
		"location":"right",
		"picture":"res://images/symbols/RIGHT_wall_symbol.jpg",
		"line":"You hear the rumbling sound outside. You might have done something right.",
		"option1":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option2":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option3":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"result":"germanic-right"
	},
	"frankish_right_result":{
		"type":"result",
		"location":"right",
		"picture":"res://images/symbols/RIGHT_wall_symbol.jpg",
		"line":"You hear the rumbling sound outside. You might have done something right.",
		"option1":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option2":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option3":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"result":"frankish-right"
	},
	"break_right":{
		"type":"result",
		"location":"right",
		"picture":"res://images/symbols/RIGHT_wall_symbol.jpg",
		"line":"You break the RIGHT wall. You hear the rumbling sound outside. You might have done something right.",
		"option1":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option2":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"option3":{
			"text":"Return to the center.",
			"value":"normal_center"
		},
		"result":"break-right"
	},
	"normal_center":{
		"type":"choice",
		"location":"center",
		"picture":"res://images/black_square.png",
		"line":"You are in the middle of the Place. What do you do?",
		"option1":{
			"text":"Approach the LEFT wall.",
			"value":"init_left"
		},
		"option2":{
			"text":"Approach the FRONT wall.",
			"value":"init_front"
		},
		"option3":{
			"text":"Approach the RIGHT wall.",
			"value":"init_right"
		}
	}
}

var assimilation = [
	{"line":"The Place starts to shake, and even harder. Your body levitates to the air. The port the front wall opens.","image":"res://images/23_logo.png"},
	{"line":"Those extraordinary powers come back again to wrap you around again.","image":"res://images/23_logo.png"},
	{"line":"Inside-out, your body transform into the true inner beast you have suppressed and hidden all these times.","image":"res://images/23_logo.png"},
	{"line":"With all the humanity you have shed along the way, you will accept another way of life.","image":"res://images/23_logo.png"},
	{"line":"Many demons - larger than those you have fought - come from the portal to you and say, \"You have proven your worthiness. Come join us.\"","image":"res://images/23_logo.png"}
]

var aboveHuman = [
	{"line":"The Place starts to shake, then it stops.","image":"res://images/23_logo.png"},
	{"line":"You see a beam of light behind you on the front wall.","image":"res://images/23_logo.png"},
	{"line":"You come out of the Place and see the night sky above.","image":"res://images/23_logo.png"},
	{"line":"You see the starless night reflecting your true self.","image":"res://images/23_logo.png"},
	{"line":"Your ordeal and the use of invincibility wisely have proven that you are..... more than a human.","image":"res://images/23_logo.png"}
]

var twentyThreeHundred = [
	{"line":"The Place starts to shake, and the portal on the front wall opens.","image":"res://images/23_logo.png"},
	{"line":"The mysterious colors shine on you like a crazy diamond, and ingulf you in.","image":"res://images/23_logo.png"},
	{"line":"Then your amulet rattles. It then takes off from you and morphs into a human shape.","image":"res://images/23_logo.png"},
	{"line":"The amulet turns into the knight in a biopunk armor. The knight used to be a human being, but became rather unnatural once he entered into a different dimension.","image":"res://images/23_logo.png"},
	{"line":"Since you didn't succeed in closing the portal to the other dimension, you have no choice but continue the journey with the amulet knight.","image":"res://images/23_logo.png"}
]

var deadMeat = [
	{"line":"The Place starts to shake.","image":"res://images/23_logo.png"},
	{"line":"You, while claiming on your humanity, are lying on the ground exhausted.","image":"res://images/23_logo.png"},
	{"line":"More demons from the portal swarm in.","image":"res://images/23_logo.png"},
	{"line":"Each of them take a part of your flesh, and others followed.","image":"res://images/23_logo.png"},
	{"line":"You are their latest meal.","image":"res://images/23_logo.png"}
]

var fullExit = [
	{"line":"The Place starts to shake, then it stops.","image":"res://images/23_logo.png"},
	{"line":"You see a beam of light behind you on the front wall.","image":"res://images/23_logo.png"},
	{"line":"You come out of the Place, and it crumbles down to the ground.","image":"res://images/23_logo.png"},
	{"line":"You see the night sky full of stars.","image":"res://images/23_logo.png"},
	{"line":"And the light from a full moon shines on you like a spotlight.","image":"res://images/23_logo.png"}
]
