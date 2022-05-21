parseints() = parse.(Int, split(readline()))

function main()
    n, m = parseints()
    cl = falses(n)
    pty = zeros(Int, n)
    for i in 1:m
        pr, s = split(readline())
        p = parse(Int, pr)
        cl[p] && continue
        if s == "WA"
            pty[p] += 1
        else
            cl[p] = true
        end
    end
    c = 0
    pn = 0
    for i in 1:n
        cl[i] || continue
        c += 1
        pn += pty[i]
    end
    println("$c $pn")
end

main()
