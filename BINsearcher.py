from binascii import unhexlify
from os import listdir, makedirs
from os.path import exists, isfile, join
from re import findall

if __name__ == "__main__":
    keywords = []
    if exists(path="keywords.txt"):
        with open(file="keywords.txt",
                  mode="r",
                  encoding="UTF-8") as keywords_txt:
            for line in keywords_txt.readlines():
                if line.strip() != "":
                    keywords.append(line.strip())
        if len(keywords) == 0:
            print(f"В файле \"keywords.txt\" нет ключевых слов!\n"
                  f"Добавьте ключевые слова в этот файл!\n"
                  f"На одной строке одно слово!")
            input()
            exit()
        else:
            if exists(path="bin"):
                files, data, i = [x for x in listdir(path="bin") if isfile(path=join("bin", x))], [], 1
                if len(files) == 0:
                    print("В папке \"bin\" нет файлов!\n"
                          "Загрузите в нее бинарные файлы в которых нужно найти данные!")
                    input()
                    exit()
                else:
                    for file in files:
                        print(f"[{i} из {len(files)}] Ищем данные в: {join('bin', file)}")
                        with open(file=join("bin", file),
                                  mode="rb") as file_bin:
                            for bin_data in file_bin.readlines():
                                decoded_data = unhexlify(bin_data.hex()).decode(encoding="ANSI")
                                for keyword in keywords:
                                    for word in findall(pattern=f"({keyword}_[a-zA-Z0-9_]+)",
                                                        string=decoded_data):
                                        data.append(word)
                        i += 1
                    with open(file="output_data.txt",
                              mode="w",
                              encoding="UTF-8") as output_data_txt:
                        for item in set(data):
                            if str(item).startswith("Pony_"):
                                item = f"			<StoredItem ID=\"{item}\" PonyLevel=\"5\"/>"
                            if str(item).startswith("House_"):
                                item = f"			<StoredItem ID=\"{item}\"/>"
                            if str(item).startswith("POP_"):
                                item = f"			<Item ID=\"{item}\"/>"
                            if str(item).startswith("Decoration_"):
                                item = f"			<StoredItem ID=\"{item}\" Count=\"1000\"/>"
                            if str(item).startswith("Theme_"):
                                item = f"			<OwnedTheme ID=\"{item}\"/>"
                            if str(item).startswith("Path_"):
                                item = f"			<StoredItem ID=\"{item}\"/>"
                            output_data_txt.write(f"{item}\n")
            else:
                makedirs(name="bin")
                print("Папки \"bin\" не существует!\n"
                      "Создайте папку и загрузите в нее бинарные файлы в которых нужно найти данные!")
                input()
                exit()
    else:
        with open(file="keywords.txt",
                  mode="w",
                  encoding="UTF-8") as keywords_txt:
            keywords_txt.close()
        print(f"Файл \"keywords.txt\" отсутсвует!\n"
              f"Создайте файл и добавьте в него ключевые слова!\n"
              f"На одной строке одно слово!")
        input()
        exit()
