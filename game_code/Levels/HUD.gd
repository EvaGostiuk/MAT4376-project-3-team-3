extends CanvasLayer

onready var timer = get_node("FunFact/Timer")

var papers = Checkpoint.fun_fact_id 
var fun_facts_hub =[
"Movement:\n Forward => \"D\" or \"Right Arrow\",                You can reference Dictionary by pressing \"R\" \n Back => \"A\" or \"Left Arrow\",                       When you want to go back to running screen press \"Q\" \n Jump => \"W\" or \"Space\"",
"Task:\n You need to visit 4 airports where you will compile report about queueing sustem for each airfield. After all airports are visited, you need to find a receptionist with blue eyes to get the comparison of different airfields.\nList of airports: Auckland(AUC), Saint-Francois(SAF), Chebucto(CWL), Queenston(QUE) \n "
]


func _ready():
	$PapersCount.text = String(papers)
	timer.set_wait_time(25)
	$FunFact.visible = false

func _on_collectible_collected():
	if Checkpoint.airfield == null:
		$FunFact/FunFact_text.text = fun_facts_hub[papers]
	elif Checkpoint.airfield == "AUC":
		$FunFact/FunFact_text.text = PauseMenuData.fun_facts_AUC[papers %7]
		if papers < 7:
			PauseMenuData.contents[4] += PauseMenuData.fun_facts_AUC[papers %7] + "\n"
	elif Checkpoint.airfield == "CWL":
		$FunFact/FunFact_text.text = PauseMenuData.fun_facts_CWL[papers %1]
		if papers < 1:
			PauseMenuData.contents[6] += PauseMenuData.fun_facts_AUC[papers] + "\n"
	elif Checkpoint.airfield == "SAF":
		$FunFact/FunFact_text.text = PauseMenuData.fun_facts_SAF[papers %7]
		if papers < 7:
			PauseMenuData.contents[5] += PauseMenuData.fun_facts_AUC[papers %7] + "\n"
	elif Checkpoint.airfield == "QUE":
		$FunFact/FunFact_text.text = PauseMenuData.fun_facts_QUE[papers %5]
		if papers < 5:
			PauseMenuData.contents[7] += PauseMenuData.fun_facts_AUC[papers %5] + "\n"
	papers += 1
	Checkpoint.fun_fact_id = papers
	$Sound_paper.play()
	_ready()
	$FunFact.visible = true
	timer.start()


func _on_Timer_timeout():
		$FunFact.visible = false
