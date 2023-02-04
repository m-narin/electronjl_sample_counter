using Electron

include("useImage.jl")

app = Application()

main_html_uri = string("file:///", replace(joinpath(@__DIR__, "main.html"), '\\' => '/'))

win = Window(app, URI(main_html_uri))

ElectronAPI.setBounds(win, Dict("width"=>600, "height"=>600))

cmd = open("main.js") do file
  read(file, String)
end

run(win, cmd)
ch = msgchannel(win)
request = Dict()
dataArray = [0]

while true
  try 
    global request = take!(ch)
    println("request: ",request)
  catch 
    println("channle closed")
    break
  end

  if request["order"] == "plus"
    global dataArray
    push!(dataArray, dataArray[end]+request["input_number"])
    run(win,"setCountNumber(\"$(dataArray[end])\");")

  elseif request["order"] == "reset"
    dataArray = [0]
    run(win,"setCountNumber(0);")
  end

  file_name = make_accumulation_image(dataArray)
  run(win,"setImage(\"output_images/accumulation_image/$(file_name)\");")

  println("regenerate window")

end