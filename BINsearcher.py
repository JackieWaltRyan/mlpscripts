from os import listdir, makedirs
from os.path import exists, isfile, join
from re import findall

if __name__ == "__main__":
    keywords, path = [], "bin"
    if exists(path="keywords.txt"):
        with open(file="keywords.txt",
                  mode="r",
                  encoding="UTF-8") as keywords_txt:
            for line in keywords_txt.readlines():
                if line.strip() != "":
                    keywords.append(line.strip().encode(encoding="UTF-8",
                                                        errors="ignore"))
        if len(keywords) == 0:
            print(f"В файле keywords.txt нет ключевых слов. "
                  f"Добавьте ключевые слова в этот файл. "
                  f"На одной строке одно слово.")
            input()
            exit()
        else:
            if exists(path=path):
                files = [x for x in listdir(path=path) if isfile(path=join(path, x)) and join(path, x).endswith(".bin")]
                data, i = [], 1
                if len(files) > 0:
                    for file in files:
                        print(f"[{i} из {len(files)}] Ищем данные в: {join(path, file)}")
                        with open(file=join(path, file),
                                  mode="rb") as bin_file:
                            for line in bin_file.readlines():
                                for keyword in keywords:
                                    for word in findall(pattern=rb"(%s_\w+)" % keyword,
                                                        string=line):
                                        if word.decode(encoding="UTF-8",
                                                       errors="ignore") not in data:
                                            data.append(word.decode(encoding="UTF-8",
                                                                    errors="ignore"))
                        i += 1
                    with open(file="output_data.xml",
                              mode="w",
                              encoding="UTF-8") as output_data_xml:
                        for item in data:
                            if item.startswith("Pony_"):
                                item = f"			<StoredItem ID=\"{item}\" PonyLevel=\"5\"/>"
                            if item.startswith("House_"):
                                item = f"			<StoredItem ID=\"{item}\"/>"
                            if item.startswith("POP_"):
                                item = f"			<Item ID=\"{item}\"/>"
                            if item.startswith("Decoration_"):
                                item = f"			<StoredItem ID=\"{item}\" Count=\"1000\"/>"
                            if item.startswith("Theme_"):
                                item = f"			<OwnedTheme ID=\"{item}\"/>"
                            if item.startswith("RoadBuildingPermit_"):
                                item = f"			<OwnedRBP ID=\"{item}\"/>"
                            output_data_xml.write(f"{item}\n")
                else:
                    print(f"В папке {path} нет файлов. "
                          f"Загрузите в нее бинарные файлы в которых нужно найти данные.")
                    input()
                    exit()
            else:
                makedirs(name=path)
                print(f"Папки {path} не существует. "
                      f"Была создана пустая папка. "
                      f"Загрузите в нее бинарные файлы в которых нужно найти данные.")
                input()
                exit()
    else:
        with open(file="keywords.txt",
                  mode="w",
                  encoding="UTF-8") as keywords_txt:
            keywords_txt.close()
        print(f"Файл keywords.txt не существует. "
              f"Был создан пустой файл. "
              f"Добавьте в него ключевые слова. "
              f"На одной строке одно слово.")
        input()
        exit()
