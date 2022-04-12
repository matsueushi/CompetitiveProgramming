function subseq(k, s)
    ans = ""
    len = 0
    i_s = 1
    i_e = length(s) - k + 1
    while (len < k)
        c, j = findmin(s[i_s:i_e])
        ans *= c
        i_s += j
        i_e += 1
        len += 1
    end
    ans
end

function main()
    n, k = parse.(Int64, split(readline()))
    s = readline()
    println(subseq(k, s))
end
