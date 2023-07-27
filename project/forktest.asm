
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
   6:	e8 35 00 00 00       	call   40 <forktest>
  exit();
   b:	e8 64 04 00 00       	call   474 <exit>

00000010 <printf>:
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	53                   	push   %ebx
  14:	83 ec 10             	sub    $0x10,%esp
  17:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  1a:	53                   	push   %ebx
  1b:	e8 80 01 00 00       	call   1a0 <strlen>
  20:	83 c4 0c             	add    $0xc,%esp
  23:	50                   	push   %eax
  24:	53                   	push   %ebx
  25:	ff 75 08             	pushl  0x8(%ebp)
  28:	e8 67 04 00 00       	call   494 <write>
}
  2d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  30:	83 c4 10             	add    $0x10,%esp
  33:	c9                   	leave  
  34:	c3                   	ret    
  35:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000040 <forktest>:
{
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	53                   	push   %ebx
  for(n=0; n<N; n++){
  44:	31 db                	xor    %ebx,%ebx
{
  46:	83 ec 10             	sub    $0x10,%esp
  write(fd, s, strlen(s));
  49:	68 c8 06 00 00       	push   $0x6c8
  4e:	e8 4d 01 00 00       	call   1a0 <strlen>
  53:	83 c4 0c             	add    $0xc,%esp
  56:	50                   	push   %eax
  57:	68 c8 06 00 00       	push   $0x6c8
  5c:	6a 01                	push   $0x1
  5e:	e8 31 04 00 00       	call   494 <write>
  63:	83 c4 10             	add    $0x10,%esp
  66:	eb 19                	jmp    81 <forktest+0x41>
  68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  6f:	90                   	nop
    if(pid == 0)
  70:	74 58                	je     ca <forktest+0x8a>
  for(n=0; n<N; n++){
  72:	83 c3 01             	add    $0x1,%ebx
  75:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  7b:	0f 84 83 00 00 00    	je     104 <forktest+0xc4>
    pid = fork();
  81:	e8 e6 03 00 00       	call   46c <fork>
    if(pid < 0)
  86:	85 c0                	test   %eax,%eax
  88:	79 e6                	jns    70 <forktest+0x30>
  for(; n > 0; n--){
  8a:	85 db                	test   %ebx,%ebx
  8c:	74 10                	je     9e <forktest+0x5e>
  8e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
  90:	e8 e7 03 00 00       	call   47c <wait>
  95:	85 c0                	test   %eax,%eax
  97:	78 36                	js     cf <forktest+0x8f>
  for(; n > 0; n--){
  99:	83 eb 01             	sub    $0x1,%ebx
  9c:	75 f2                	jne    90 <forktest+0x50>
  if(wait() != -1){
  9e:	e8 d9 03 00 00       	call   47c <wait>
  a3:	83 f8 ff             	cmp    $0xffffffff,%eax
  a6:	75 49                	jne    f1 <forktest+0xb1>
  write(fd, s, strlen(s));
  a8:	83 ec 0c             	sub    $0xc,%esp
  ab:	68 fa 06 00 00       	push   $0x6fa
  b0:	e8 eb 00 00 00       	call   1a0 <strlen>
  b5:	83 c4 0c             	add    $0xc,%esp
  b8:	50                   	push   %eax
  b9:	68 fa 06 00 00       	push   $0x6fa
  be:	6a 01                	push   $0x1
  c0:	e8 cf 03 00 00       	call   494 <write>
}
  c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c8:	c9                   	leave  
  c9:	c3                   	ret    
      exit();
  ca:	e8 a5 03 00 00       	call   474 <exit>
  write(fd, s, strlen(s));
  cf:	83 ec 0c             	sub    $0xc,%esp
  d2:	68 d3 06 00 00       	push   $0x6d3
  d7:	e8 c4 00 00 00       	call   1a0 <strlen>
  dc:	83 c4 0c             	add    $0xc,%esp
  df:	50                   	push   %eax
  e0:	68 d3 06 00 00       	push   $0x6d3
  e5:	6a 01                	push   $0x1
  e7:	e8 a8 03 00 00       	call   494 <write>
      exit();
  ec:	e8 83 03 00 00       	call   474 <exit>
    printf(1, "wait got too many\n");
  f1:	52                   	push   %edx
  f2:	52                   	push   %edx
  f3:	68 e7 06 00 00       	push   $0x6e7
  f8:	6a 01                	push   $0x1
  fa:	e8 11 ff ff ff       	call   10 <printf>
    exit();
  ff:	e8 70 03 00 00       	call   474 <exit>
    printf(1, "fork claimed to work N times!\n", N);
 104:	50                   	push   %eax
 105:	68 e8 03 00 00       	push   $0x3e8
 10a:	68 08 07 00 00       	push   $0x708
 10f:	6a 01                	push   $0x1
 111:	e8 fa fe ff ff       	call   10 <printf>
    exit();
 116:	e8 59 03 00 00       	call   474 <exit>
 11b:	66 90                	xchg   %ax,%ax
 11d:	66 90                	xchg   %ax,%ax
 11f:	90                   	nop

00000120 <strcpy>:

struct ptr_struct ptrs[64];

char *
strcpy(char *s, const char *t)
{
 120:	55                   	push   %ebp
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 121:	31 c0                	xor    %eax,%eax
{
 123:	89 e5                	mov    %esp,%ebp
 125:	53                   	push   %ebx
 126:	8b 4d 08             	mov    0x8(%ebp),%ecx
 129:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0)
 130:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 134:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 137:	83 c0 01             	add    $0x1,%eax
 13a:	84 d2                	test   %dl,%dl
 13c:	75 f2                	jne    130 <strcpy+0x10>
    ;
  return os;
}
 13e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 141:	89 c8                	mov    %ecx,%eax
 143:	c9                   	leave  
 144:	c3                   	ret    
 145:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000150 <strcmp>:

int strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 4d 08             	mov    0x8(%ebp),%ecx
 157:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 15a:	0f b6 01             	movzbl (%ecx),%eax
 15d:	0f b6 1a             	movzbl (%edx),%ebx
 160:	84 c0                	test   %al,%al
 162:	75 1d                	jne    181 <strcmp+0x31>
 164:	eb 2a                	jmp    190 <strcmp+0x40>
 166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16d:	8d 76 00             	lea    0x0(%esi),%esi
 170:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 174:	83 c1 01             	add    $0x1,%ecx
 177:	83 c2 01             	add    $0x1,%edx
  return (uchar)*p - (uchar)*q;
 17a:	0f b6 1a             	movzbl (%edx),%ebx
  while (*p && *p == *q)
 17d:	84 c0                	test   %al,%al
 17f:	74 0f                	je     190 <strcmp+0x40>
 181:	38 d8                	cmp    %bl,%al
 183:	74 eb                	je     170 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 185:	29 d8                	sub    %ebx,%eax
}
 187:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 18a:	c9                   	leave  
 18b:	c3                   	ret    
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 190:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 192:	29 d8                	sub    %ebx,%eax
}
 194:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 197:	c9                   	leave  
 198:	c3                   	ret    
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <strlen>:

uint strlen(const char *s)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for (n = 0; s[n]; n++)
 1a6:	80 3a 00             	cmpb   $0x0,(%edx)
 1a9:	74 15                	je     1c0 <strlen+0x20>
 1ab:	31 c0                	xor    %eax,%eax
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
 1b0:	83 c0 01             	add    $0x1,%eax
 1b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1b7:	89 c1                	mov    %eax,%ecx
 1b9:	75 f5                	jne    1b0 <strlen+0x10>
    ;
  return n;
}
 1bb:	89 c8                	mov    %ecx,%eax
 1bd:	5d                   	pop    %ebp
 1be:	c3                   	ret    
 1bf:	90                   	nop
  for (n = 0; s[n]; n++)
 1c0:	31 c9                	xor    %ecx,%ecx
}
 1c2:	5d                   	pop    %ebp
 1c3:	89 c8                	mov    %ecx,%eax
 1c5:	c3                   	ret    
 1c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cd:	8d 76 00             	lea    0x0(%esi),%esi

000001d0 <memset>:

void *
memset(void *dst, int c, uint n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1da:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dd:	89 d7                	mov    %edx,%edi
 1df:	fc                   	cld    
 1e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1e5:	89 d0                	mov    %edx,%eax
 1e7:	c9                   	leave  
 1e8:	c3                   	ret    
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001f0 <strchr>:

char *
strchr(const char *s, char c)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 1fa:	0f b6 10             	movzbl (%eax),%edx
 1fd:	84 d2                	test   %dl,%dl
 1ff:	75 12                	jne    213 <strchr+0x23>
 201:	eb 1d                	jmp    220 <strchr+0x30>
 203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 207:	90                   	nop
 208:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 20c:	83 c0 01             	add    $0x1,%eax
 20f:	84 d2                	test   %dl,%dl
 211:	74 0d                	je     220 <strchr+0x30>
    if (*s == c)
 213:	38 d1                	cmp    %dl,%cl
 215:	75 f1                	jne    208 <strchr+0x18>
      return (char *)s;
  return 0;
}
 217:	5d                   	pop    %ebp
 218:	c3                   	ret    
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 220:	31 c0                	xor    %eax,%eax
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    
 224:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <gets>:

char *
gets(char *buf, int max)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 235:	31 f6                	xor    %esi,%esi
{
 237:	53                   	push   %ebx
 238:	89 f3                	mov    %esi,%ebx
 23a:	83 ec 1c             	sub    $0x1c,%esp
 23d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for (i = 0; i + 1 < max;)
 240:	eb 2f                	jmp    271 <gets+0x41>
 242:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  {
    cc = read(0, &c, 1);
 248:	83 ec 04             	sub    $0x4,%esp
 24b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 24e:	6a 01                	push   $0x1
 250:	50                   	push   %eax
 251:	6a 00                	push   $0x0
 253:	e8 34 02 00 00       	call   48c <read>
    if (cc < 1)
 258:	83 c4 10             	add    $0x10,%esp
 25b:	85 c0                	test   %eax,%eax
 25d:	7e 1c                	jle    27b <gets+0x4b>
      break;
    buf[i++] = c;
 25f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    if (c == '\n' || c == '\r')
 263:	83 c7 01             	add    $0x1,%edi
    buf[i++] = c;
 266:	88 47 ff             	mov    %al,-0x1(%edi)
    if (c == '\n' || c == '\r')
 269:	3c 0a                	cmp    $0xa,%al
 26b:	74 23                	je     290 <gets+0x60>
 26d:	3c 0d                	cmp    $0xd,%al
 26f:	74 1f                	je     290 <gets+0x60>
  for (i = 0; i + 1 < max;)
 271:	83 c3 01             	add    $0x1,%ebx
    buf[i++] = c;
 274:	89 fe                	mov    %edi,%esi
  for (i = 0; i + 1 < max;)
 276:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 279:	7c cd                	jl     248 <gets+0x18>
 27b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 27d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 280:	c6 03 00             	movb   $0x0,(%ebx)
}
 283:	8d 65 f4             	lea    -0xc(%ebp),%esp
 286:	5b                   	pop    %ebx
 287:	5e                   	pop    %esi
 288:	5f                   	pop    %edi
 289:	5d                   	pop    %ebp
 28a:	c3                   	ret    
 28b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 28f:	90                   	nop
  buf[i] = '\0';
 290:	8b 75 08             	mov    0x8(%ebp),%esi
}
 293:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 296:	01 de                	add    %ebx,%esi
 298:	89 f3                	mov    %esi,%ebx
 29a:	c6 03 00             	movb   $0x0,(%ebx)
}
 29d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2a0:	5b                   	pop    %ebx
 2a1:	5e                   	pop    %esi
 2a2:	5f                   	pop    %edi
 2a3:	5d                   	pop    %ebp
 2a4:	c3                   	ret    
 2a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002b0 <stat>:

int stat(const char *n, struct stat *st)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	56                   	push   %esi
 2b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b5:	83 ec 08             	sub    $0x8,%esp
 2b8:	6a 00                	push   $0x0
 2ba:	ff 75 08             	pushl  0x8(%ebp)
 2bd:	e8 f2 01 00 00       	call   4b4 <open>
  if (fd < 0)
 2c2:	83 c4 10             	add    $0x10,%esp
 2c5:	85 c0                	test   %eax,%eax
 2c7:	78 27                	js     2f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2c9:	83 ec 08             	sub    $0x8,%esp
 2cc:	ff 75 0c             	pushl  0xc(%ebp)
 2cf:	89 c3                	mov    %eax,%ebx
 2d1:	50                   	push   %eax
 2d2:	e8 f5 01 00 00       	call   4cc <fstat>
  close(fd);
 2d7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2da:	89 c6                	mov    %eax,%esi
  close(fd);
 2dc:	e8 bb 01 00 00       	call   49c <close>
  return r;
 2e1:	83 c4 10             	add    $0x10,%esp
}
 2e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2e7:	89 f0                	mov    %esi,%eax
 2e9:	5b                   	pop    %ebx
 2ea:	5e                   	pop    %esi
 2eb:	5d                   	pop    %ebp
 2ec:	c3                   	ret    
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2f5:	eb ed                	jmp    2e4 <stat+0x34>
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax

00000300 <atoi>:

int atoi(const char *s)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	53                   	push   %ebx
 304:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while ('0' <= *s && *s <= '9')
 307:	0f be 02             	movsbl (%edx),%eax
 30a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 30d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 310:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 315:	77 1e                	ja     335 <atoi+0x35>
 317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31e:	66 90                	xchg   %ax,%ax
    n = n * 10 + *s++ - '0';
 320:	83 c2 01             	add    $0x1,%edx
 323:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 326:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 32a:	0f be 02             	movsbl (%edx),%eax
 32d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 330:	80 fb 09             	cmp    $0x9,%bl
 333:	76 eb                	jbe    320 <atoi+0x20>
  return n;
}
 335:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 338:	89 c8                	mov    %ecx,%eax
 33a:	c9                   	leave  
 33b:	c3                   	ret    
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000340 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	8b 45 10             	mov    0x10(%ebp),%eax
 347:	8b 55 08             	mov    0x8(%ebp),%edx
 34a:	56                   	push   %esi
 34b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while (n-- > 0)
 34e:	85 c0                	test   %eax,%eax
 350:	7e 13                	jle    365 <memmove+0x25>
 352:	01 d0                	add    %edx,%eax
  dst = vdst;
 354:	89 d7                	mov    %edx,%edi
 356:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 360:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 361:	39 f8                	cmp    %edi,%eax
 363:	75 fb                	jne    360 <memmove+0x20>
  return vdst;
}
 365:	5e                   	pop    %esi
 366:	89 d0                	mov    %edx,%eax
 368:	5f                   	pop    %edi
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    
 36b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <new_lock>:

// new
void new_lock(my_lock *l)
{
  ;
}
 370:	c3                   	ret    
 371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 378:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37f:	90                   	nop

00000380 <lock>:
 380:	c3                   	ret    
 381:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 388:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38f:	90                   	nop

00000390 <unlock>:
 390:	c3                   	ret    
 391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 398:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop

000003a0 <thread_create>:
{
  ;
}

int thread_create(void (*fn)(void *), void *arg)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	83 ec 14             	sub    $0x14,%esp
  void *thread_stack_pointer = malloc(PGSIZE * 2);
 3a6:	68 00 20 00 00       	push   $0x2000
 3ab:	e8 10 02 00 00       	call   5c0 <malloc>

  if (thread_stack_pointer == 0)
 3b0:	83 c4 10             	add    $0x10,%esp
 3b3:	85 c0                	test   %eax,%eax
 3b5:	74 25                	je     3dc <thread_create+0x3c>
    return -1;

  // Check allocated stack is complete
  if ((uint)thread_stack_pointer % PGSIZE) // if not complete then add more
 3b7:	89 c2                	mov    %eax,%edx
 3b9:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 3bf:	74 07                	je     3c8 <thread_create+0x28>
    thread_stack_pointer = thread_stack_pointer + (PGSIZE - ((uint)thread_stack_pointer % PGSIZE));
 3c1:	29 d0                	sub    %edx,%eax
 3c3:	05 00 10 00 00       	add    $0x1000,%eax

  int thread_id = clone(fn, arg, thread_stack_pointer);
 3c8:	83 ec 04             	sub    $0x4,%esp
 3cb:	50                   	push   %eax
 3cc:	ff 75 0c             	pushl  0xc(%ebp)
 3cf:	ff 75 08             	pushl  0x8(%ebp)
 3d2:	e8 3d 01 00 00       	call   514 <clone>
  return thread_id;
 3d7:	83 c4 10             	add    $0x10,%esp
}
 3da:	c9                   	leave  
 3db:	c3                   	ret    
 3dc:	c9                   	leave  
    return -1;
 3dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 3e2:	c3                   	ret    
 3e3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003f0 <thread_join>:

int thread_join()
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
  void* stack;
  int ret = join(&stack);
 3f5:	8d 45 e4             	lea    -0x1c(%ebp),%eax
{
 3f8:	53                   	push   %ebx
 3f9:	83 ec 28             	sub    $0x28,%esp
  int ret = join(&stack);
 3fc:	50                   	push   %eax
 3fd:	e8 1a 01 00 00       	call   51c <join>
  // Checking if all the children are zombie
  for(int i = 0; i < 64; i++){
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 402:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 405:	83 c4 10             	add    $0x10,%esp
  for(int i = 0; i < 64; i++){
 408:	31 d2                	xor    %edx,%edx
  int ret = join(&stack);
 40a:	89 c3                	mov    %eax,%ebx
  for(int i = 0; i < 64; i++){
 40c:	b8 40 0a 00 00       	mov    $0xa40,%eax
 411:	eb 10                	jmp    423 <thread_join+0x33>
 413:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 417:	90                   	nop
 418:	83 c2 01             	add    $0x1,%edx
 41b:	83 c0 0c             	add    $0xc,%eax
 41e:	83 fa 40             	cmp    $0x40,%edx
 421:	74 3f                	je     462 <thread_join+0x72>
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 423:	83 38 01             	cmpl   $0x1,(%eax)
 426:	75 f0                	jne    418 <thread_join+0x28>
 428:	39 48 08             	cmp    %ecx,0x8(%eax)
 42b:	75 eb                	jne    418 <thread_join+0x28>
      free(ptrs[i].ptr);
 42d:	8d 34 52             	lea    (%edx,%edx,2),%esi
 430:	83 ec 0c             	sub    $0xc,%esp
 433:	c1 e6 02             	shl    $0x2,%esi
 436:	ff b6 44 0a 00 00    	pushl  0xa44(%esi)
 43c:	e8 ef 00 00 00       	call   530 <free>
      ptrs[i].stack = NULL;
      ptrs[i].busy = 0;
      ptrs[i].ptr = NULL;
      break;
 441:	83 c4 10             	add    $0x10,%esp
      ptrs[i].stack = NULL;
 444:	c7 86 48 0a 00 00 00 	movl   $0x0,0xa48(%esi)
 44b:	00 00 00 
      ptrs[i].busy = 0;
 44e:	c7 86 40 0a 00 00 00 	movl   $0x0,0xa40(%esi)
 455:	00 00 00 
      ptrs[i].ptr = NULL;
 458:	c7 86 44 0a 00 00 00 	movl   $0x0,0xa44(%esi)
 45f:	00 00 00 
    }
  }
  return ret;
}
 462:	8d 65 f4             	lea    -0xc(%ebp),%esp
 465:	89 d8                	mov    %ebx,%eax
 467:	5b                   	pop    %ebx
 468:	5e                   	pop    %esi
 469:	5f                   	pop    %edi
 46a:	5d                   	pop    %ebp
 46b:	c3                   	ret    

0000046c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 46c:	b8 01 00 00 00       	mov    $0x1,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <exit>:
SYSCALL(exit)
 474:	b8 02 00 00 00       	mov    $0x2,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <wait>:
SYSCALL(wait)
 47c:	b8 03 00 00 00       	mov    $0x3,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <pipe>:
SYSCALL(pipe)
 484:	b8 04 00 00 00       	mov    $0x4,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <read>:
SYSCALL(read)
 48c:	b8 05 00 00 00       	mov    $0x5,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <write>:
SYSCALL(write)
 494:	b8 10 00 00 00       	mov    $0x10,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <close>:
SYSCALL(close)
 49c:	b8 15 00 00 00       	mov    $0x15,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <kill>:
SYSCALL(kill)
 4a4:	b8 06 00 00 00       	mov    $0x6,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <exec>:
SYSCALL(exec)
 4ac:	b8 07 00 00 00       	mov    $0x7,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <open>:
SYSCALL(open)
 4b4:	b8 0f 00 00 00       	mov    $0xf,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <mknod>:
SYSCALL(mknod)
 4bc:	b8 11 00 00 00       	mov    $0x11,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <unlink>:
SYSCALL(unlink)
 4c4:	b8 12 00 00 00       	mov    $0x12,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <fstat>:
SYSCALL(fstat)
 4cc:	b8 08 00 00 00       	mov    $0x8,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <link>:
SYSCALL(link)
 4d4:	b8 13 00 00 00       	mov    $0x13,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <mkdir>:
SYSCALL(mkdir)
 4dc:	b8 14 00 00 00       	mov    $0x14,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <chdir>:
SYSCALL(chdir)
 4e4:	b8 09 00 00 00       	mov    $0x9,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <dup>:
SYSCALL(dup)
 4ec:	b8 0a 00 00 00       	mov    $0xa,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <getpid>:
SYSCALL(getpid)
 4f4:	b8 0b 00 00 00       	mov    $0xb,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <sbrk>:
SYSCALL(sbrk)
 4fc:	b8 0c 00 00 00       	mov    $0xc,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <sleep>:
SYSCALL(sleep)
 504:	b8 0d 00 00 00       	mov    $0xd,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <uptime>:
SYSCALL(uptime)
 50c:	b8 0e 00 00 00       	mov    $0xe,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <clone>:
// new
SYSCALL(clone)
 514:	b8 16 00 00 00       	mov    $0x16,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <join>:
SYSCALL(join)
 51c:	b8 17 00 00 00       	mov    $0x17,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    
 524:	66 90                	xchg   %ax,%ax
 526:	66 90                	xchg   %ax,%ax
 528:	66 90                	xchg   %ax,%ax
 52a:	66 90                	xchg   %ax,%ax
 52c:	66 90                	xchg   %ax,%ax
 52e:	66 90                	xchg   %ax,%ax

00000530 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 530:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 531:	a1 40 0d 00 00       	mov    0xd40,%eax
{
 536:	89 e5                	mov    %esp,%ebp
 538:	57                   	push   %edi
 539:	56                   	push   %esi
 53a:	53                   	push   %ebx
 53b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 53e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 541:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 548:	89 c2                	mov    %eax,%edx
 54a:	8b 00                	mov    (%eax),%eax
 54c:	39 ca                	cmp    %ecx,%edx
 54e:	73 30                	jae    580 <free+0x50>
 550:	39 c1                	cmp    %eax,%ecx
 552:	72 04                	jb     558 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 554:	39 c2                	cmp    %eax,%edx
 556:	72 f0                	jb     548 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 558:	8b 73 fc             	mov    -0x4(%ebx),%esi
 55b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 55e:	39 f8                	cmp    %edi,%eax
 560:	74 30                	je     592 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 562:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 565:	8b 42 04             	mov    0x4(%edx),%eax
 568:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 56b:	39 f1                	cmp    %esi,%ecx
 56d:	74 3a                	je     5a9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 56f:	89 0a                	mov    %ecx,(%edx)
  freep = p;
}
 571:	5b                   	pop    %ebx
  freep = p;
 572:	89 15 40 0d 00 00    	mov    %edx,0xd40
}
 578:	5e                   	pop    %esi
 579:	5f                   	pop    %edi
 57a:	5d                   	pop    %ebp
 57b:	c3                   	ret    
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 580:	39 c2                	cmp    %eax,%edx
 582:	72 c4                	jb     548 <free+0x18>
 584:	39 c1                	cmp    %eax,%ecx
 586:	73 c0                	jae    548 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 588:	8b 73 fc             	mov    -0x4(%ebx),%esi
 58b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 58e:	39 f8                	cmp    %edi,%eax
 590:	75 d0                	jne    562 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 592:	03 70 04             	add    0x4(%eax),%esi
 595:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 598:	8b 02                	mov    (%edx),%eax
 59a:	8b 00                	mov    (%eax),%eax
 59c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 59f:	8b 42 04             	mov    0x4(%edx),%eax
 5a2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5a5:	39 f1                	cmp    %esi,%ecx
 5a7:	75 c6                	jne    56f <free+0x3f>
    p->s.size += bp->s.size;
 5a9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 5ac:	89 15 40 0d 00 00    	mov    %edx,0xd40
    p->s.size += bp->s.size;
 5b2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 5b5:	8b 43 f8             	mov    -0x8(%ebx),%eax
 5b8:	89 02                	mov    %eax,(%edx)
}
 5ba:	5b                   	pop    %ebx
 5bb:	5e                   	pop    %esi
 5bc:	5f                   	pop    %edi
 5bd:	5d                   	pop    %ebp
 5be:	c3                   	ret    
 5bf:	90                   	nop

000005c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 5cc:	8b 3d 40 0d 00 00    	mov    0xd40,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5d2:	8d 70 07             	lea    0x7(%eax),%esi
 5d5:	c1 ee 03             	shr    $0x3,%esi
 5d8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 5db:	85 ff                	test   %edi,%edi
 5dd:	0f 84 ad 00 00 00    	je     690 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5e3:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 5e5:	8b 48 04             	mov    0x4(%eax),%ecx
 5e8:	39 f1                	cmp    %esi,%ecx
 5ea:	73 71                	jae    65d <malloc+0x9d>
 5ec:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 5f2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 5f7:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 5fa:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 601:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 604:	eb 1b                	jmp    621 <malloc+0x61>
 606:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 610:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 612:	8b 4a 04             	mov    0x4(%edx),%ecx
 615:	39 f1                	cmp    %esi,%ecx
 617:	73 4f                	jae    668 <malloc+0xa8>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 619:	8b 3d 40 0d 00 00    	mov    0xd40,%edi
 61f:	89 d0                	mov    %edx,%eax
 621:	39 c7                	cmp    %eax,%edi
 623:	75 eb                	jne    610 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 625:	83 ec 0c             	sub    $0xc,%esp
 628:	ff 75 e4             	pushl  -0x1c(%ebp)
 62b:	e8 cc fe ff ff       	call   4fc <sbrk>
  if(p == (char*)-1)
 630:	83 c4 10             	add    $0x10,%esp
 633:	83 f8 ff             	cmp    $0xffffffff,%eax
 636:	74 1b                	je     653 <malloc+0x93>
  hp->s.size = nu;
 638:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 63b:	83 ec 0c             	sub    $0xc,%esp
 63e:	83 c0 08             	add    $0x8,%eax
 641:	50                   	push   %eax
 642:	e8 e9 fe ff ff       	call   530 <free>
  return freep;
 647:	a1 40 0d 00 00       	mov    0xd40,%eax
      if((p = morecore(nunits)) == 0)
 64c:	83 c4 10             	add    $0x10,%esp
 64f:	85 c0                	test   %eax,%eax
 651:	75 bd                	jne    610 <malloc+0x50>
        return 0;
  }
}
 653:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 656:	31 c0                	xor    %eax,%eax
}
 658:	5b                   	pop    %ebx
 659:	5e                   	pop    %esi
 65a:	5f                   	pop    %edi
 65b:	5d                   	pop    %ebp
 65c:	c3                   	ret    
    if(p->s.size >= nunits){
 65d:	89 c2                	mov    %eax,%edx
 65f:	89 f8                	mov    %edi,%eax
 661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 668:	39 ce                	cmp    %ecx,%esi
 66a:	74 54                	je     6c0 <malloc+0x100>
        p->s.size -= nunits;
 66c:	29 f1                	sub    %esi,%ecx
 66e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 671:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 674:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 677:	a3 40 0d 00 00       	mov    %eax,0xd40
}
 67c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 67f:	8d 42 08             	lea    0x8(%edx),%eax
}
 682:	5b                   	pop    %ebx
 683:	5e                   	pop    %esi
 684:	5f                   	pop    %edi
 685:	5d                   	pop    %ebp
 686:	c3                   	ret    
 687:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 690:	c7 05 40 0d 00 00 44 	movl   $0xd44,0xd40
 697:	0d 00 00 
    base.s.size = 0;
 69a:	bf 44 0d 00 00       	mov    $0xd44,%edi
    base.s.ptr = freep = prevp = &base;
 69f:	c7 05 44 0d 00 00 44 	movl   $0xd44,0xd44
 6a6:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6a9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 6ab:	c7 05 48 0d 00 00 00 	movl   $0x0,0xd48
 6b2:	00 00 00 
    if(p->s.size >= nunits){
 6b5:	e9 32 ff ff ff       	jmp    5ec <malloc+0x2c>
 6ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 6c0:	8b 0a                	mov    (%edx),%ecx
 6c2:	89 08                	mov    %ecx,(%eax)
 6c4:	eb b1                	jmp    677 <malloc+0xb7>
