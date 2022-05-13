function solve(a, b, s)
    chs = "0123456789"
    for i in 1:a+b+1
        if i == a + 1
            s[i] == '-' || return false
        else
            s[i] ∈ chs || return false
        end
    end
    true
end

function main()
    a, b = parse.(Int, split(readline()))
    s = readline()
    println(solve(a, b, s) ? "Yes" : "No")
end

main()
