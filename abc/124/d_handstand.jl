parseints() = parse.(Int, split(readline()))

function solve(n, k, s)
    sp = [1]
    for i in 2:n
        s[i-1] != s[i] && push!(sp, i)
    end
    push!(sp, n + 1)
    chars = diff(sp)
    pushfirst!(chars, 0)
    cchars = cumsum(chars)

    nc = length(chars)
    w = min(2 * k, nc - 1)

    res = 0
    for i in 1:nc-w
        res = max(res, cchars[i+w] - cchars[i])
    end
    if w < nc
        w2 = w + 1
        if first(s) == '1'
            for i in 1:2:nc-w2
                res = max(res, cchars[i+w2] - cchars[i])
            end
        else
            for i in 2:2:nc-w2
                res = max(res, cchars[i+w2] - cchars[i])
            end
        end
    end
    res
end

function main()
    n, k = parseints()
    s = readline()
    solve(n, k, s) |> println
end

main()
