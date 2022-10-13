from os import getcwd, walk, remove
from os.path import join

if __name__ == "__main__":
    for root, dirs, files in walk(top=getcwd()):
        for file in files:
            if file.endswith(".loc"):
                print(f"Конвертируем: {join(root, file)}")
                with open(file=join(root, file), mode="rb") as input_file:
                    data, datapointer, asciiOrUTF, output = input_file.read(), 4, 1, ""
                    while datapointer < len(data):
                        symcount = data[datapointer:datapointer + 4]
                        symcount = int.from_bytes(bytes=symcount, byteorder="little")
                        datapointer += 4
                        tmp = data[datapointer:datapointer + (symcount * asciiOrUTF)]
                        if asciiOrUTF == 1:
                            output += tmp.decode(encoding="utf8")
                            datapointer += symcount * asciiOrUTF
                            asciiOrUTF = 2
                        else:
                            tmp = tmp.decode(encoding="utf-16-le")
                            if tmp.endswith("\n"):
                                tmp = tmp[:-1]
                            if len(tmp) > 0:
                                output += "=" + tmp + "\n"
                            else:
                                output += "\n"
                            datapointer += symcount * asciiOrUTF
                            asciiOrUTF = 1
                with open(file=join(root, file)[:-4] + ".txt", mode="wt", encoding="utf-8") as output_file:
                    output_file.write(output[:-1])
                    remove(path=join(root, file))
    input()
    exit()
