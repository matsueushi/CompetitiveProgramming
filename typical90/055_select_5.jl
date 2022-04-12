function check(n, p, q, as, i, ac, pd, ans)
    ac == 5 && return pd % p == q ? ans + 1 : ans
    if i < n
        ans = check(n, p, q, as, i + 1, ac, pd, ans)
        ans = check(n, p, q, as, i + 1, ac + 1, pd * as[i+1] % p, ans)
    end
    return ans
end

function main()
    n, p, q = parse.(Int64, split(readline()))
    as = parse.(Int64, split(readline()))
    println(check(n, p, q, as, 0, 0, 1, 0))
end

main()
