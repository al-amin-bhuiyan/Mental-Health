# PowerShell script to replace hardcoded values with responsive units

$files = @(
    "lib\pages\sign_up\sign_up.dart",
    "lib\pages\forget_password\forget_password.dart",
    "lib\pages\new_password\new_password.dart",
    "lib\pages\on_boarding\on_boarding.dart",
    "lib\pages\verification_code\verification_code.dart",
    "lib\view\screen\splash_screen.dart"
)

foreach ($file in $files) {
    $filePath = "C:\Users\shobuj\StudioProjects\mental_health\$file"

    if (Test-Path $filePath) {
        Write-Host "Processing: $file"

        $content = Get-Content $filePath -Raw

        # Add flutter_screenutil import if not present
        if ($content -notmatch "import 'package:flutter_screenutil/flutter_screenutil.dart';") {
            $content = $content -replace "(import 'package:flutter/material.dart';)", "`$1`nimport 'package:flutter_screenutil/flutter_screenutil.dart';"
        }

        # Replace const EdgeInsets patterns
        $content = $content -replace "const EdgeInsets\.symmetric\(horizontal:\s*(\d+(?:\.\d+)?)\)", "EdgeInsets.symmetric(horizontal: `$1.w)"
        $content = $content -replace "const EdgeInsets\.symmetric\(vertical:\s*(\d+(?:\.\d+)?)\)", "EdgeInsets.symmetric(vertical: `$1.h)"
        $content = $content -replace "const EdgeInsets\.symmetric\(\s*horizontal:\s*(\d+(?:\.\d+)?),\s*vertical:\s*(\d+(?:\.\d+)?)\s*\)", "EdgeInsets.symmetric(horizontal: `$1.w, vertical: `$2.h)"

        # Replace const SizedBox patterns
        $content = $content -replace "const SizedBox\(height:\s*(\d+(?:\.\d+)?)\)", "SizedBox(height: `$1.h)"
        $content = $content -replace "const SizedBox\(width:\s*(\d+(?:\.\d+)?)\)", "SizedBox(width: `$1.w)"

        # Replace non-const SizedBox patterns
        $content = $content -replace "SizedBox\(height:\s*(\d+(?:\.\d+)?)\)(?!\.)", "SizedBox(height: `$1.h)"
        $content = $content -replace "SizedBox\(width:\s*(\d+(?:\.\d+)?)\)(?!\.)", "SizedBox(width: `$1.w)"

        # Replace fontSize patterns
        $content = $content -replace "fontSize:\s*(\d+(?:\.\d+)?),", "fontSize: `$1.sp,"
        $content = $content -replace "fontSize:\s*(\d+(?:\.\d+)?)\s*\)", "fontSize: `$1.sp)"

        # Replace width and height in widgets
        $content = $content -replace "width:\s*(\d+(?:\.\d+)?),", "width: `$1.w,"
        $content = $content -replace "height:\s*(\d+(?:\.\d+)?),", "height: `$1.h,"

        # Replace BorderRadius.circular
        $content = $content -replace "BorderRadius\.circular\((\d+(?:\.\d+)?)\)", "BorderRadius.circular(`$1.r)"

        # Replace border width
        $content = $content -replace "width:\s*(\d+(?:\.\d+)?)\s*\)", "width: `$1.w)"

        # Replace const Size patterns
        $content = $content -replace "const Size\((\d+(?:\.\d+)?),\s*(\d+(?:\.\d+)?)\)", "Size(`$1.w, `$2.h)"
        $content = $content -replace "minimumSize:\s*const\s*Size\(0,\s*0\)", "minimumSize: Size(0, 0)"

        # Replace icon sizes
        $content = $content -replace "size:\s*(\d+(?:\.\d+)?)\s*\)", "size: `$1.sp)"

        # Replace thickness
        $content = $content -replace "thickness:\s*(\d+(?:\.\d+)?),", "thickness: `$1.h,"

        # Save the file
        Set-Content $filePath -Value $content -NoNewline

        Write-Host "Completed: $file" -ForegroundColor Green
    }
    else {
        Write-Host "File not found: $file" -ForegroundColor Red
    }
}

Write-Host "`nAll files processed!" -ForegroundColor Cyan

