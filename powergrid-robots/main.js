const WIDTH = 500;
const HEIGHT = 500;
const N_POINTS= 100000;
const RED = [255, 0, 0];

/* html elements */
let button = document.getElementById('button0');
let phase1 = document.getElementById('phase1');
let phase2 = document.getElementById('phase2');
let phase3 = document.getElementById('phase3');
let phase4 = document.getElementById('phase4');
let special = document.getElementById('special');

function random_select(list)
{
	let index = Math.floor(Math.random() * list.length)
	return list[index]
}

function randomize()
{
	let letters = ['a','b','c','d','e', 'f'];

	let path = '';

	path = './images/phase1_' + random_select(letters) + '.png';
	phase1.src = path
	path = './images/phase2_' + random_select(letters) + '.png';
	phase2.src = path
	path = './images/phase3_' + random_select(letters) + '.png';
	phase3.src = path
	path = './images/phase4_' + random_select(letters) + '.png';
	phase4.src = path
	path = './images/special_' + random_select(letters) + '.png';
	special.src = path

	//debugger;
}

//button.addEventListener('click', randomize);

randomize();
