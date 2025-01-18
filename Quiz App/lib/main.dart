import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: QuizApp());
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  int countIndex = 1;
  bool isPressed = true;
  int correctCount = 0;
  int wrongCount = 0;
  List<Map> questionList = [
    {
      "question": "Who is the founder of Microsoft?",
      "answers": ["Steve Jobs", "Bill Gates", "Mark Zukerberg", "Elon Musk"],
      "correctAns": 1,
    },
    {
      "question": "Who is the founder of Apple?",
      "answers": ["Steve Jobs", "Bill Gates", "Mark Zukerberg", "Elon Musk"],
      "correctAns": 0,
    },
    {
      "question": "Who is the founder of Meta?",
      "answers": ["Steve Jobs", "Bill Gates", "Mark Zukerberg", "Elon Musk"],
      "correctAns": 2,
    },
    {
      "question": "Who is the founder of Tesla?",
      "answers": ["Steve Jobs", "Bill Gates", "Mark Zukerberg", "Elon Musk"],
      "correctAns": 3,
    },
    {
      "question": "Who is the founder of SpaceX?",
      "answers": ["Steve Jobs", "Bill Gates", "Mark Zukerberg", "Elon Musk"],
      "correctAns": 3,
    }
  ];

  bool for1 = true;
  bool for2 = true;
  bool for3 = true;
  bool for4 = true;
  bool for5 = true;

  int stateChange = -1;
  WidgetStateProperty<Color?> changeColor(int i) {
    if (stateChange != -1) {
      if (i == questionList[countIndex - 1]["correctAns"]) {
        return const WidgetStatePropertyAll(Colors.green);
      } else if (stateChange == i) {
        return const WidgetStatePropertyAll(Colors.red);
      } else {
        return const WidgetStatePropertyAll(Colors.grey);
      }
    } else {
      return const WidgetStatePropertyAll(Colors.grey);
    }
  }

  void freezeColor() {
    if (countIndex == 1 && ii == questionList[countIndex - 1]["correctAns"] ||
        stateChange == ii) {
      if (for1 == true) {
        for1 = false;
        
      }
    }
    if (countIndex == 2 && ii == questionList[countIndex - 1]["correctAns"] ||
        stateChange == ii) {
      if (for2 == true) {
        for2 = false;
        
      }
    }
    if (countIndex == 3 && ii == questionList[countIndex - 1]["correctAns"] ||
        stateChange == ii) {
      if (for3 == true) {
        for3 = false;
        
      }
    }
    if (countIndex == 4 && ii == questionList[countIndex - 1]["correctAns"] ||
        stateChange == ii) {
      if (for4 == true) {
        for4 = false;
        
      }
    }
    if (countIndex == 5 && ii == questionList[countIndex - 1]["correctAns"] ||
        stateChange == ii) {
      if (for5 == true) {
        for5 = false;
        
      }
    }
  }

  int forcount = 1;
  int ii = 0;

  int changeColorCount() {
    if (ii == questionList[countIndex - 1]["correctAns"]) {
      return correctCount++;
    } else {
      return wrongCount++;
    }
  }
  // int z=0;
  // WidgetStatePropertyAll<Color?> reviveColor(bool x) {
  //   if (stateChange != -1) {
  //     if (ii == questionList[countIndex - 1]["correctAns"]) {
  //       return const WidgetStatePropertyAll(Colors.green);
  //     } else if (stateChange == ii) {
  //       return const WidgetStatePropertyAll(Colors.red);
  //     } else {
  //       return const WidgetStatePropertyAll(Colors.grey);
  //     }

  //   } else {
  //     return const WidgetStatePropertyAll(Colors.grey);
  //   }
  // }

  // }
  int extra = 1;

  @override
  Widget build(BuildContext context) {
    return toogleMethod();
  }

  Scaffold toogleMethod() {
    if (countIndex <= questionList.length) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              width: 400,
              height: 30,
            ),
            Text(
              "Questions : $countIndex / ${questionList.length}",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              questionList[countIndex - 1]["question"],
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 200,
              height: 40,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: changeColor(0)),
                onPressed: () => {
                  if (stateChange == -1)
                    {
                      stateChange = 0,
                      ii = 0,
                      changeColorCount(),
                      freezeColor(),
                    },
                  setState(() {})
                },
                child: Text(
                  questionList[countIndex - 1]["answers"][0],
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              width: 200,
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: changeColor(1)),
                onPressed: () => {
                  if (stateChange == -1)
                    {
                      stateChange = 1,
                      ii = 1,
                      changeColorCount(),
                      freezeColor(),
                    },
                  setState(() {})
                },
                child: Text(
                  questionList[countIndex - 1]["answers"][1],
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              width: 200,
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: changeColor(2)),
                onPressed: () => {
                  if (stateChange == -1)
                    {
                      stateChange = 2,
                      ii = 2,
                      changeColorCount(),
                      freezeColor(),
                    },
                  setState(() {})
                },
                child: Text(
                  questionList[countIndex - 1]["answers"][2],
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              width: 200,
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: changeColor(3)),
                onPressed: () => {
                  if (stateChange == -1)
                    {
                      stateChange = 3,
                      ii = 3,
                      changeColorCount(),
                      freezeColor(),
                    },
                  setState(() {})
                },
                child: Text(
                  questionList[countIndex - 1]["answers"][3],
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            Container(
              height: 40,
            ),
            const SizedBox(
              width: 200,
            ),
            Container(
              height: 20,
            ),
            const SizedBox(
              width: 200,
            ),
          ],
        ),
        floatingActionButton: Row(
          children: [
            const SizedBox(
              width: 32,
            ),
            FloatingActionButton(
              onPressed: () => {
                if (countIndex > 1)
                  {
                    countIndex--,
                    ii = countIndex,
                    stateChange = ii,
                    // reviveColor(),
                    // stateChange = ii - countIndex,
                    // ii == questionList[countIndex - 1]["correctAns"]
                  },
                setState(() {}),
              },
              backgroundColor: Colors.black,
              child: const Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 263,
            ),
            FloatingActionButton(
              onPressed: () => {
                if (stateChange != -1)
                  {
                    if (countIndex <= questionList.length)
                      {
                        extra++,
                        stateChange = -1,
                        countIndex++,
                      },
                  },
                setState(() {})
              },
              backgroundColor: Colors.black,
              child: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    } else {
      WidgetStateProperty<Color?> restartButton(int x) {
        return const WidgetStatePropertyAll(Colors.grey);
      }

      return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Quiz Result",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Congratulations",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.network(
                      "https://cdn-icons-png.flaticon.com/256/8289/8289880.png"),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "Your Score:",
                  style: TextStyle(
                      color: Colors.brown,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Correct Answers : $correctCount",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text("Wrong Answers : $wrongCount",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () => {
                    countIndex = 1,
                    correctCount = 0,
                    wrongCount = 0,
                    toogleMethod(),
                    setState(() {})
                  },
                  style: ButtonStyle(backgroundColor: restartButton(0)),
                  child: const Text(
                    "Restart",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                )
              ],
            ),
          ));
    }
  }
}
