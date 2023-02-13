from os import getcwd, walk, remove
from os.path import join

if __name__ == "__main__":
    for root, dirs, files in walk(top=getcwd()):
        for file in files:
            if file.endswith(".loc"):
                filename = join(root, file)
                print(f"Конвертируем: {filename}")
                with open(file=filename,
                          mode="rb") as file_loc:
                    data, datapointer, asciiOrUTF, output = file_loc.read(), 4, 1, ""
                    while datapointer < len(data):
                        symcount = data[datapointer:datapointer + 4]
                        symcount = int.from_bytes(bytes=symcount,
                                                  byteorder="little")
                        datapointer += 4
                        tmp = data[datapointer:datapointer + (symcount * asciiOrUTF)]
                        if asciiOrUTF == 1:
                            output += tmp.decode(encoding="UTF-8")
                            datapointer += symcount * asciiOrUTF
                            asciiOrUTF = 2
                        else:
                            tmp = tmp.decode(encoding="UTF-16-LE")
                            if tmp.endswith("\n"):
                                tmp = tmp[:-1]
                            if len(tmp) > 0:
                                output += "=" + tmp + "\n"
                            else:
                                output += "\n"
                            datapointer += symcount * asciiOrUTF
                            asciiOrUTF = 1
                with open(file=filename[:-4] + ".txt",
                          mode="w",
                          encoding="UTF-8") as fhw:
                    fhw.write(output[:-1])
                    remove(filename)
