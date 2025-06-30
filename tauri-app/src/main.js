const { invoke } = window.__TAURI__.core;
const { open } = window.__TAURI__.dialog;

async function run_gitinspectorgui(repoPath) {
  return await invoke("run_gitinspector_gui", { repoDir: repoPath });
}

window.addEventListener("DOMContentLoaded", () => {
  document.querySelector("#greet-form").addEventListener("submit", async (e) => {
    e.preventDefault();
    const repoPath = document.getElementById("repo-path").value;
    const htmlString = await run_gitinspectorgui(repoPath);

    document.querySelector("main.container").style.display = "none";
    const reportPage = document.getElementById("report-page");
    reportPage.style.display = "block";

    // Populate the iframe with the HTML string
    const iframe = document.getElementById("report-iframe");
    iframe.contentWindow.document.open();
    iframe.contentWindow.document.write(htmlString);
    iframe.contentWindow.document.close();

    // Make back button appear to switch back to main page
    if (!document.getElementById("back-btn")) {
      const backBtn = document.createElement("button");
      backBtn.id = "back-btn";
      backBtn.textContent = "Back";
      backBtn.style.position = "absolute";
      backBtn.style.top = "10px";
      backBtn.style.left = "10px";
      backBtn.onclick = () => {
        reportPage.style.display = "none";
        document.querySelector("main.container").style.display = "block";
      };
      reportPage.appendChild(backBtn);
    }
  });


  document.getElementById("select-folder-btn").addEventListener("click", async () => {
    const folderPath = await window.__TAURI__.dialog.open({
      directory: true,
      multiple: false,
    });
    console.log('Selected folder:', folderPath);
    document.getElementById('repo-path').value = folderPath || 'No folder selected';
  });
});

