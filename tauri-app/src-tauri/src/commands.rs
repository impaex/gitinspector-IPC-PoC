use std::fs;
use std::path::PathBuf;
use std::process::Command;

/// Tauri command to run the CLI tool and return path to the generated HTML file
#[tauri::command]
pub fn run_gitinspector_gui(repo_dir: String) -> Result<String, String> {
    println!("Running gitinspector GUI CLI...");

    let output = Command::new("uv")
        .args(&[
            "run",
            "gitinspectorgui-old",
            "-r",
            &repo_dir,
            "--file-format",
            "html",
        ])
        .output()
        .map_err(|e| format!("Failed to run command: {}", e))?;

    if !output.status.success() {
        println!(
            "Command failed with stderr:\n{}",
            String::from_utf8_lossy(&output.stderr)
        );

        return Err(format!(
            "Command failed: {}",
            String::from_utf8_lossy(&output.stderr)
        ));
    }

    // Return the HTML code from stdout as a String
    let html_code = String::from_utf8_lossy(&output.stdout).to_string();
    Ok(html_code)
}
