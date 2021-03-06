<!DOCTYPE html>
<html>
<head>
<title>TeamA</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<br><br>
<h1>Hangman</h1>
<body onLoad="reset(); return true;">
<center>
	<br />
	<br />
	
	<p>
		<img src="hmstart.gif" height="125" width="75" name="hm" alt="image unavailable" />
	</p>
	
	<p id="word" hidden></p>
	<p id="hint"></p>
	<br />
	
	<form name="game">
		<p style="font-weight:bold; font-size:18px;">
			Display Word: &nbsp;&nbsp;&nbsp;<input type="text" style="cursor:no-drop; width:200px; font-size:18px;" name="displayWord" disabled />
			<br />
			<br />
			Used Letters: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="cursor:no-drop; width:200px; font-size:18px;" name="usedLetters" disabled />
		</p>
	</form>

	<br />
	<br />
	
	<p style="font-weight:bold; font-size:18px;">

	<label>Choose a letter:</label>

	<br />
	<br />
	<br />
	
	<a href="javascript:selectLetter('Q');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="Q"></a>
	<a href="javascript:selectLetter('W');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="W"></a>
	<a href="javascript:selectLetter('E');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="E"></a>
	<a href="javascript:selectLetter('R');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="R"></a>
	<a href="javascript:selectLetter('T');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="T"></a>
	<a href="javascript:selectLetter('Y');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="Y"></a>
	<a href="javascript:selectLetter('U');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="U"></a>
	<a href="javascript:selectLetter('I');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="I"></a>
	<a href="javascript:selectLetter('O');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="O"></a>
	<a href="javascript:selectLetter('P');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="P"></a>
	<br />
	<br />
	<a href="javascript:selectLetter('A');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="A"></a>
	<a href="javascript:selectLetter('S');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="S"></a>
	<a href="javascript:selectLetter('D');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="D"></a>
	<a href="javascript:selectLetter('F');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="F"></a>
	<a href="javascript:selectLetter('G');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="G"></a>
	<a href="javascript:selectLetter('H');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="H"></a>
	<a href="javascript:selectLetter('J');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="J"></a>
	<a href="javascript:selectLetter('K');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="K"></a>
	<a href="javascript:selectLetter('L');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="L"></a>
	<br />
	<br />
	<a href="javascript:selectLetter('Z');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="Z"></a>
	<a href="javascript:selectLetter('X');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="X"></a>
	<a href="javascript:selectLetter('C');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="C"></a>
	<a href="javascript:selectLetter('V');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="V"></a>
	<a href="javascript:selectLetter('B');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="B"></a>
	<a href="javascript:selectLetter('N');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="N"></a>
	<a href="javascript:selectLetter('M');"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="M"></a>

	</p>

	<br />

	<p>
	<a href="javascript:reset()"><input type="button" style="cursor:pointer; margin-left: 10px; font-size:18px;" value="Start game / Reset game"></a>
	</p>	
	


<script>
	var can_play = true;
	var words = new Array("DEVOPS","MAVEN","NEXUS","TOMCAT","JENKINS","GITHUB","SONARQUBE","VAGRANT","PIPELINE","LINUX");
	var to_guess = "";
	var display_word = "";
	var used_letters = "";
	var wrong_guesses = 0;
	
	//RANDOM
	random_number = Math.round(Math.random() * (words.length - 1));
	to_guess = words[random_number];
	document.getElementById("word").innerHTML = to_guess;

	//HINTS
	if (to_guess=="DEVOPS"){
		document.getElementById("hint").innerHTML = "<b>Hint:</b>&nbsp;&nbsp; <i>automating and monitoring the process of software</i>";
	}
	if (to_guess=="MAVEN"){
		document.getElementById("hint").innerHTML = "<b>Hint:</b>&nbsp;&nbsp; <i>project management tool that is based on POM</i>";
	}
	if (to_guess=="NEXUS"){
		document.getElementById("hint").innerHTML = "<b>Hint:</b>&nbsp;&nbsp; <i>configure your build to publish artifacts</i>";
	}
	if (to_guess=="TOMCAT"){
		document.getElementById("hint").innerHTML = "<b>Hint:</b>&nbsp;&nbsp; <i>used to deploy your Java Servlets and JSPs</i>";
	}
	if (to_guess=="JENKINS"){
		document.getElementById("hint").innerHTML = "<b>Hint:</b>&nbsp;&nbsp; <i>open source automation server written in Java</i>";
	}
	if (to_guess=="GITHUB"){
		document.getElementById("hint").innerHTML = "<b>Hint:</b>&nbsp;&nbsp; <i> a web-based Git or version control repository and Internet hosting service</i>";
	}
	if (to_guess=="SONARQUBE"){
		document.getElementById("hint").innerHTML = "<b>Hint:</b>&nbsp;&nbsp; <i>inspection of code quality to perform automatic reviews with static analysis of code to detect bugs, code smells and security vulnerabilities</i>";
	}
	if (to_guess=="VAGRANT"){
		document.getElementById("hint").innerHTML = "<b>Hint:</b>&nbsp;&nbsp; <i>uses virtual machines to run environments independent of the host machine</i>";
	}
	if (to_guess=="PIPELINE"){
		document.getElementById("hint").innerHTML = "<b>Hint:</b>&nbsp;&nbsp; <i>a suite of plugins which supports implementing and integrating continuous delivery pipelines into Jenkins</i>";
	}
	if (to_guess=="LINUX"){
		document.getElementById("hint").innerHTML = "<b>Hint:</b>&nbsp;&nbsp; <i>an open-source operating system modelled on UNIX.</i>";
	}

	function selectLetter(l)
	{
		if (can_play == false)
		{
			return;
		}

		if (used_letters.indexOf(l) != -1)
		{
			return;
		}
	
		used_letters += l;
		document.game.usedLetters.value = used_letters;
	
		if (to_guess.indexOf(l) != -1)
		{
	
			// correct letter guess
			pos = 0;
			temp_mask = display_word;

			while (to_guess.indexOf(l, pos) != -1)
			{ 
				pos = to_guess.indexOf(l, pos);			
				end = pos + 1;

				start_text = temp_mask.substring(0, pos);
				end_text = temp_mask.substring(end, temp_mask.length);

				temp_mask = start_text + l + end_text;
				pos = end;
			}

			display_word = temp_mask;
			document.game.displayWord.value = display_word;
		
			if (display_word.indexOf("#") == -1)
			{
				// won
				alert("Well done, you have won!");
				can_play = false;
			}
		}
		else
		{
			// incortect letter guess
			wrong_guesses += 1;
			eval("document.hm.src=\"hm" + wrong_guesses + ".png\"");
		
			if (wrong_guesses == 6)
			{
				// lost
				alert("Sorry, you have lost!");
				can_play = false;
			}
		}
	}

	function reset()
	{
		selectWord();
		document.game.usedLetters.value = "";
		used_letters = "";
		wrong_guesses = 0;
		document.hm.src="hmstart.png";
	}

	function selectWord()
	{
		can_play = true;
		
	
		// display masked word
		masked_word = createMask(to_guess);
		document.game.displayWord.value = masked_word;
		display_word = masked_word;
	}

	function createMask(m)
	{
		mask = "";
		word_lenght = m.length;

		for (i = 0; i < word_lenght; i ++)
		{
			mask += "#";
		}
		return mask;
	}
	

</script>
</center>
</body>
</html>
