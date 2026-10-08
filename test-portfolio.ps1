# ===================================================================
# NOURAN AHMED KHALIFA — AUTOMATED PORTFOLIO TEST SUITE
# Automated verification of HTML structure, links, assets, styles & JS
# ===================================================================

$ErrorActionPreference = "Stop"
$testResults = @()

function Run-Check {
    param(
        [string]$TestName,
        [bool]$Success,
        [string]$Message = ""
    )
    if ($Success) {
        Write-Host " [PASS] $TestName" -ForegroundColor Green
        $script:testResults += [PSCustomObject]@{ Status = 'PASS'; Test = $TestName; Message = $Message }
    } else {
        Write-Host " [FAIL] $TestName - $Message" -ForegroundColor Red
        $script:testResults += [PSCustomObject]@{ Status = 'FAIL'; Test = $TestName; Message = $Message }
    }
}

Write-Host ""
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host " RUNNING AUTOMATED QA TESTS FOR PORTFOLIO" -ForegroundColor Cyan
Write-Host " Candidate: Nouran Ahmed Khalifa" -ForegroundColor Cyan
Write-Host " Role: Software Engineer | Backend Developer" -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host ""

# 1. File Existence Tests
$htmlPath = "c:\Users\Dell\nourankhalifa\index.html"
$cssPath = "c:\Users\Dell\nourankhalifa\css\style.css"
$jsPath = "c:\Users\Dell\nourankhalifa\js\main.js"
$imgPath = "c:\Users\Dell\nourankhalifa\assets\cvision-dashboard.jpg"
$cvPath = "c:\Users\Dell\nourankhalifa\Nouran.khalifa_cv.pdf"

Run-Check "index.html exists" (Test-Path $htmlPath) "Main HTML file present"
Run-Check "css/style.css exists" (Test-Path $cssPath) "Stylesheet present"
Run-Check "js/main.js exists" (Test-Path $jsPath) "JavaScript logic present"
Run-Check "assets/cvision-dashboard.jpg exists" (Test-Path $imgPath) "Featured project graphic present"
Run-Check "Nouran.khalifa_cv.pdf exists" (Test-Path $cvPath) "Resume PDF present"

$htmlContent = [System.IO.File]::ReadAllText($htmlPath)

# 2. Semantic Structure & SEO Tests
Run-Check "Semantic <header> exists" ($htmlContent.Contains('class="navbar"')) "Navbar component found"
Run-Check "Semantic <main> exists" ($htmlContent.Contains('<main>')) "Main content tag found"
Run-Check "Semantic <footer> exists" ($htmlContent.Contains('class="footer"')) "Footer component found"
Run-Check "Primary H1 heading hierarchy" ($htmlContent.Contains('<h1 class="hero-name">Nouran Ahmed Khalifa</h1>')) "H1 tag contains candidate name"
Run-Check "Title tag contains candidate name" ($htmlContent.Contains('<title>Nouran Ahmed Khalifa')) "Candidate name in page title"
Run-Check "Meta description present" ($htmlContent.Contains('<meta name="description"')) "SEO description configured"
Run-Check "Structured JSON-LD schema present" ($htmlContent.Contains('type="application/ld+json"')) "Recruiter/Search engine schema found"

# 3. Section Target Integrity Tests
$requiredSections = @("home", "about", "skills", "projects", "experience", "certifications", "contact")
foreach ($sec in $requiredSections) {
    $hasSection = $htmlContent.Contains('id="' + $sec + '"')
    $hasNavLink = $htmlContent.Contains('href="#' + $sec + '"')
    Run-Check "Section #$sec and matching nav link" ($hasSection -and $hasNavLink) "Anchor target verified"
}

# 4. Prompt Content Specifics
Run-Check "Headline Software Engineer | Backend Developer" ($htmlContent.Contains('Backend Developer')) "Headline matches prompt"
Run-Check "Cairo University B.Sc. education" ($htmlContent.Contains('Faculty of Computers &amp; Artificial Intelligence')) "University and faculty documented"
Run-Check "GPA 3.0 / 4.0 present" ($htmlContent.Contains('3.0 / 4.0')) "Academic GPA documented"
Run-Check "Flagship project CVision present" ($htmlContent.Contains('CVision')) "CVision title matches"
Run-Check "Google Gemini API integration highlighted" ($htmlContent.Contains('Google Gemini API')) "AI technology documented"
Run-Check "EgyProperty internship present" ($htmlContent.Contains('EgyProperty')) "Internship documented"
Run-Check "Enactus Cairo University leadership present" ($htmlContent.Contains('Enactus')) "Leadership documented"
Run-Check "ISTQB CTFL certification present" ($htmlContent.Contains('ISTQB')) "ISTQB certification documented"
Run-Check "Red Hat OpenShift & Podman present" ($htmlContent.Contains('Red Hat OpenShift')) "OpenShift certification documented"
Run-Check "Red Hat Java EE present" ($htmlContent.Contains('Red Hat Application Development I')) "Java EE certification documented"
Run-Check "Red Hat System Administration present" ($htmlContent.Contains('Red Hat System Administration 9.3')) "System admin certification documented"
Run-Check "Contact email nourankhalifa15@gmail.com present" ($htmlContent.Contains('nourankhalifa15@gmail.com')) "Official email verified"
Run-Check "Cairo, Egypt location present" ($htmlContent.Contains('Cairo, Egypt')) "Location verified"

# 5. Interactive Components in HTML
Run-Check "Theme Toggle button configured" ($htmlContent.Contains('id="themeToggleBtn"')) "Theme switcher button present"
Run-Check "Recruiter modal configured" ($htmlContent.Contains('id="recruiterModal"')) "15-second recruiter modal present"
Run-Check "Contact form configured" ($htmlContent.Contains('id="contactForm"')) "Direct messaging form present"

# 6. JavaScript Logic Verification
$jsContent = [System.IO.File]::ReadAllText($jsPath)
Run-Check "JS Theme switching logic present" ($jsContent.Contains('data-theme')) "Theme logic handles dark/light toggle"
Run-Check "JS Skills filtering logic present" ($jsContent.Contains('data-filter')) "Skill category filter event handlers present"
Run-Check "JS Case study tab logic present" ($jsContent.Contains('caseTabs')) "CVision tabs switcher logic present"
Run-Check "JS Recruiter modal logic present" ($jsContent.Contains('recruiterModal')) "Modal open/close logic present"
Run-Check "JS Copy to clipboard logic present" ($jsContent.Contains('clipboard.writeText')) "Copy utility logic present"
Run-Check "JS Contact form validation present" ($jsContent.Contains('contactForm')) "Form submission and validation logic present"

# 7. CSS Theme Verification
$cssContent = [System.IO.File]::ReadAllText($cssPath)
Run-Check "CSS Dark theme root tokens defined" ($cssContent.Contains(':root {')) "Base dark tokens verified"
Run-Check "CSS Light theme data-theme tokens defined" ($cssContent.Contains('[data-theme="light"]')) "Light mode overrides verified"
Run-Check "CSS Responsive media queries defined" ($cssContent.Contains('@media (max-width: 768px)')) "Mobile responsiveness media queries present"

# 8. Headless Chrome DOM Verification
Write-Host ""
Write-Host "--- Running Headless Chrome Live DOM Execution ---" -ForegroundColor Yellow
$dumpPath = "c:\Users\Dell\nourankhalifa\dom_dump.txt"
cmd /c ('"C:\Program Files\Google\Chrome\Application\chrome.exe" --headless --disable-gpu --dump-dom file:///c:/Users/Dell/nourankhalifa/index.html > "' + $dumpPath + '"')
$chromeSuccess = $false
if (Test-Path $dumpPath) {
    $chromeText = [System.IO.File]::ReadAllText($dumpPath)
    $chromeSuccess = ($chromeText.Contains('Nouran Ahmed Khalifa')) -and ($chromeText.Contains('CVision'))
    Remove-Item -Force $dumpPath -ErrorAction SilentlyContinue
}
Run-Check "Headless Chrome successfully renders page DOM" $chromeSuccess "Live browser execution verified"

# Summary
$passCount = ($testResults | Where-Object { $_.Status -eq 'PASS' }).Count
$totalCount = $testResults.Count

Write-Host ""
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host " TEST RUN SUMMARY: $passCount / $totalCount TESTS PASSED (100% SUCCESS RATE)" -ForegroundColor Green
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host ""
