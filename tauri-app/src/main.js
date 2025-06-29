const { invoke } = window.__TAURI__.core;
const { open } = window.__TAURI__.dialog;

async function run_gitinspectorgui(repoPath) {
  return await invoke("run_gitinspector_gui", { repoDir: repoPath });
}

window.addEventListener("DOMContentLoaded", () => {
  document.querySelector("#greet-form").addEventListener("submit", async (e) => {
    e.preventDefault();
    const repoPath = document.getElementById("repo-path").value;
    await run_gitinspectorgui(repoPath);
    document.getElementById("switchFile").click();
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

