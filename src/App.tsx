import { useState } from "react";
import reactLogo from "./assets/react.svg";
import { invoke } from "@tauri-apps/api/core";
import {
  exists,
  BaseDirectory,
  mkdir,
  create,
  readFile,
  writeFile,
  open,
} from "@tauri-apps/plugin-fs";

import "./App.css";

function App() {
  const [greetMsg, setGreetMsg] = useState("");
  const [name, setName] = useState("");

  async function greet() {
    // Learn more about Tauri commands at https://tauri.app/develop/calling-rust/
    setGreetMsg(await invoke("greet", { name }));
    // writeData();
    // Usage example:
    const fileName = "example.txt";
    const content = "This is a test file.";
    writeToFile(fileName, content);
    // readData();
  }

  async function readData() {
    console.log("read data");

    const pathee = BaseDirectory.AppLocalData;
    console.log("path", pathee);

    // const contents = await readFile(`videos/video1.txt`, {
    //   baseDir: BaseDirectory.AppLocalData,
    // });

    const file = await open("videos/video1.txt", {
      write: true,
      createNew: true,
      baseDir: BaseDirectory.AppLocalData,
    });
    await file.write(new TextEncoder().encode("world"));
    await file.close();
    // console.log("read data: ", contents);
  }

  const writeToFile = async (fileName: string, content: string) => {
    try {
      // Write the file to the local app data directory
      await writeFile(fileName, content, {
        baseDir: BaseDirectory.AppLocalData,
      });
      console.log("File written successfully!");
    } catch (error) {
      console.error("Error writing file:", error);
    }
  };

  async function writeData() {
    console.log("write file");
    const baseVideoDir = "videos2";
    // const baseExists = await exists(baseVideoDir, {
    //   baseDir: BaseDirectory.AppData,
    // });
    // console.log("checkl fileL:", baseExists);

    // await mkdir(baseVideoDir, {
    //   baseDir: BaseDirectory.AppData,
    //   recursive: true,
    // });
    // console.log("create directory video success");
    const file = await create(`video1.txt`, {
      baseDir: BaseDirectory.AppLocalData,
    });
    await file.write(new TextEncoder().encode("Hello world"));
    console.log("write file success");

    await file.close();
  }

  return (
    <main className="container">
      <h1>Welcome to Tauri + React</h1>

      <div className="row">
        <a href="https://vitejs.dev" target="_blank">
          <img src="/vite.svg" className="logo vite" alt="Vite logo" />
        </a>
        <a href="https://tauri.app" target="_blank">
          <img src="/tauri.svg" className="logo tauri" alt="Tauri logo" />
        </a>
        <a href="https://reactjs.org" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <p>Click on the Tauri, Vite, and React logos to learn more.</p>

      <form
        className="row"
        onSubmit={(e) => {
          e.preventDefault();
          greet();
        }}
      >
        <input
          id="greet-input"
          onChange={(e) => setName(e.currentTarget.value)}
          placeholder="Enter a name..."
        />
        <button type="submit">Greet</button>
      </form>
      <p>{greetMsg}</p>
    </main>
  );
}

export default App;
