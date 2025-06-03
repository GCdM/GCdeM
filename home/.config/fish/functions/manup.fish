# A function for manually updating programs

function manup
  set -l program_to_update $argv[1]

  switch $program_to_update
    case "" "--help" "-h"
      echo ""
      echo "Usage: manup <program>"
      echo_valid_programs
      echo ""
    case lazydocker
      curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
    case "*"
      echo ""
      echo "Invalid program: $program_to_update"
      echo_valid_programs
      echo ""
  end
end


function echo_valid_programs
  # TODO: Define `valid_programs` as a list and iterate
  echo ""
  echo "Valid programs:"
  echo "- lazydocker"
end
