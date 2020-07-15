extends Node

var p_scrpt = [
	{"line":"Your grandmother defined the phrase 23 Skidoo like this:","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"\"When in doubt, get the hell out of here now.\"","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"You should have considered her words on your 10th birthday.","image":"res://images/brick_wall-600x600.jpg"},
	{"line":"You remember on that night of your 10th birthday.","image":"res://images/brick_wall-600x600.jpg"},
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
	{"line":"Your parents saw you returning and called for medical help.","image":"res://images/brick_wall-600x600.jpg"},
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
	{"line":"You prepare by wearing the amulet, and bringing a flashlight and a sledgehammer.","image":"res://images/sledgehammer.png"},
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
	},
	"init_left":{
		"type":"choice",
		"location":"left",
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
	},
	"init_front":{
		"type":"choice",
		"location":"front",
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
	},
	"init_right":{
		"type":"choice",
		"location":"right",
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
