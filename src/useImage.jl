using Plots, Images, Dates

function make_accumulation_image(dataArray)
	rm("../output_images/accumulation_image/",recursive=true)
	mkdir("../output_images/accumulation_image")
	p = plot(dataArray, st=:bar, title="Accumulation", label="data")
	file_name = string(Dates.format(now(), "yyyymmddHHMMSS"),"_accumulation.png")
	save("../output_images/accumulation_image/$(file_name)", p)
	return file_name
end