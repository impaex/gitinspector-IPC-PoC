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

    // Print the output in the terminal
    println!(
        "Command succeeded with stdout:\n{}",
        String::from_utf8_lossy(&output.stdout)
    );

    let html_path = PathBuf::from(format!("{}-gitinspect.html", repo_dir));
    let public_path = PathBuf::from("../src/gitinspect.html".to_string()); // adjust as needed

    if html_path.exists() {
        // Copy to public directory
        fs::copy(&html_path, &public_path)
            .map_err(|e| format!("Failed to copy HTML file: {}", e))?;
        Ok("gitinspect.html".to_string())
    } else {
        Err("HTML file not found".into())
    }
}
