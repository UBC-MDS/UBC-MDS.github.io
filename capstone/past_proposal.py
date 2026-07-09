import re
import sys
import html

def convert(md_text: str) -> list[str]:
    out = []
    lines = md_text.splitlines()
    i = 0

    while i < len(lines):
        line = lines[i]
        # Look for a header row that includes the needed columns
        if line.strip().startswith("|") and "Organization" in line and "Proposal" in line:
            headers = [h.strip() for h in line.strip().strip("|").split("|")]
            try:
                idx_org = headers.index("Organization")
                idx_prop = headers.index("Proposal link")
            except ValueError:
                i += 1
                continue
            # Skip the separator line (---)
            i += 1
            if i < len(lines) and set(lines[i].replace("|", "").strip()) <= set("-: "):
                i += 1

            # Consume data rows
            while i < len(lines) and lines[i].strip().startswith("|"):
                cells = [c.strip() for c in lines[i].strip().strip("|").split("|")]
                if len(cells) <= max(idx_org, idx_prop):
                    i += 1
                    continue

                org = html.escape(cells[idx_org])

                prop_cell = cells[idx_prop]
                m = re.search(r"\[([^\]]+)\]\([^)]+\)", prop_cell)
                link_text = html.escape(m.group(1).strip()) if m else html.escape(prop_cell)

                out.append(f'<li><a href="">{org}</a>: <i>{link_text}</i></li>')
                i += 1
            continue
        i += 1
    return out

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else "input.md"
    with open(path, "r", encoding="utf-8") as f:
        md = f.read()
    for line in convert(md):
        print(line)
