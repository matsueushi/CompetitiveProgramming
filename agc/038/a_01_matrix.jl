parseints() = parse.(Int, split(readline()))

function solve(h, w, a, b)
    for i in 1:h
        if i ≤ b
            println('0'^a * '1'^(w - a))
        else
            println('1'^a * '0'^(w - a))
        end

    end
end

function main()
    h, w, a, b = parseints()
    solve(h, w, a, b)
end

main()
