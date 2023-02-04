function plus(){
  let input_number = Number(document.getElementById("input_number").value)
  let jsonString = makeJsonString("plus", input_number)
  let jsonData = JSON.parse(jsonString)
  sendMessageToJulia(jsonData)
}

function reset(){
  let jsonString = makeJsonString("reset")
  let jsonData = JSON.parse(jsonString)
  sendMessageToJulia(jsonData)
}

function makeJsonString(order, input_number=0){
  let jsonString = `{"order":"${order}","input_number":${input_number}}`;
  return jsonString
}

function setCountNumber(count_number){
  let countNumberElement = document.getElementById("count_number");
  countNumberElement.textContent = count_number
}

function setImage(file_path){
  let imageElement = document.getElementById("accumulation_image");
  imageElement.src = file_path;
}