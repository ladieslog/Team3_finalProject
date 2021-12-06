<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{margin: 0;}
	.wrap{width: 1920px; background-color: white;}
	.header{display: flex; justify-content: space-between;}
	nav ul {list-style: none; display: flex; justify-content: flex-end;}
	nav ul li { margin: 0 3px; padding: 30px 30px;}
	nav ul li a { text-decoration: none; color: black; font-family: Georgia; font-size: 20px; }
	.ab:hover { color: #6E94CC; padding-bottom: 3px; border-bottom: 1px solid #6E94CC; transition: all 0.25s;}
	
	.trip{font-size: 30px; color:#6E94CC; }
	.menu{ margin-right: 50px; }
	.log{ margin-right: 80px; margin-top: 10px; height: 100px; background-color: white;}
	.logout{ display:flex; justify-content: flex-end;}
	.a{ text-decoration: none; font-size: 15px; color:gray; }
	
</style>
</head>
<body>

	<div class="wrap header">
		<nav>
			<ul>
				<li><a href="#main" class="trip">Tripnote</a></li>
			</ul>
		</nav>
		<div class="menu">
			<nav>
				<ul>
					<li><a href="#my" class="ab">My</a></li>
					<li><a href="#diary" class="ab">Diary</a></li>
					<li><a href="#calendar" class="ab">Calendar</a></li>
					<li><a href="#CS" class="ab">Cs</a></
				</ul>
			</nav>
		</div>
	</div>
		<div class="logout log">
			<a href="#logout" class="a">logout</a>
		</div>


</body>
</html>