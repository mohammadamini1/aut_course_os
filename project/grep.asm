
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 6f                	jle    90 <main+0x90>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  27:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  2b:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
  30:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
  33:	75 2d                	jne    62 <main+0x62>
  35:	eb 6c                	jmp    a3 <main+0xa3>
  37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  3e:	66 90                	xchg   %ax,%ax
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  40:	83 ec 08             	sub    $0x8,%esp
  for(i = 2; i < argc; i++){
  43:	83 c6 01             	add    $0x1,%esi
  46:	83 c3 04             	add    $0x4,%ebx
    grep(pattern, fd);
  49:	50                   	push   %eax
  4a:	ff 75 e0             	pushl  -0x20(%ebp)
  4d:	e8 7e 01 00 00       	call   1d0 <grep>
    close(fd);
  52:	89 3c 24             	mov    %edi,(%esp)
  55:	e8 92 06 00 00       	call   6ec <close>
  for(i = 2; i < argc; i++){
  5a:	83 c4 10             	add    $0x10,%esp
  5d:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  60:	7e 29                	jle    8b <main+0x8b>
    if((fd = open(argv[i], 0)) < 0){
  62:	83 ec 08             	sub    $0x8,%esp
  65:	6a 00                	push   $0x0
  67:	ff 33                	pushl  (%ebx)
  69:	e8 96 06 00 00       	call   704 <open>
  6e:	83 c4 10             	add    $0x10,%esp
  71:	89 c7                	mov    %eax,%edi
  73:	85 c0                	test   %eax,%eax
  75:	79 c9                	jns    40 <main+0x40>
      printf(1, "grep: cannot open %s\n", argv[i]);
  77:	50                   	push   %eax
  78:	ff 33                	pushl  (%ebx)
  7a:	68 b8 0b 00 00       	push   $0xbb8
  7f:	6a 01                	push   $0x1
  81:	e8 aa 07 00 00       	call   830 <printf>
      exit();
  86:	e8 39 06 00 00       	call   6c4 <exit>
  }
  exit();
  8b:	e8 34 06 00 00       	call   6c4 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  90:	51                   	push   %ecx
  91:	51                   	push   %ecx
  92:	68 98 0b 00 00       	push   $0xb98
  97:	6a 02                	push   $0x2
  99:	e8 92 07 00 00       	call   830 <printf>
    exit();
  9e:	e8 21 06 00 00       	call   6c4 <exit>
    grep(pattern, 0);
  a3:	52                   	push   %edx
  a4:	52                   	push   %edx
  a5:	6a 00                	push   $0x0
  a7:	50                   	push   %eax
  a8:	e8 23 01 00 00       	call   1d0 <grep>
    exit();
  ad:	e8 12 06 00 00       	call   6c4 <exit>
  b2:	66 90                	xchg   %ax,%ax
  b4:	66 90                	xchg   %ax,%ax
  b6:	66 90                	xchg   %ax,%ax
  b8:	66 90                	xchg   %ax,%ax
  ba:	66 90                	xchg   %ax,%ax
  bc:	66 90                	xchg   %ax,%ax
  be:	66 90                	xchg   %ax,%ax

000000c0 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	56                   	push   %esi
  c5:	53                   	push   %ebx
  c6:	83 ec 0c             	sub    $0xc,%esp
  c9:	8b 75 08             	mov    0x8(%ebp),%esi
  cc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '\0')
  cf:	0f b6 06             	movzbl (%esi),%eax
  d2:	84 c0                	test   %al,%al
  d4:	75 2d                	jne    103 <matchhere+0x43>
  d6:	e9 7d 00 00 00       	jmp    158 <matchhere+0x98>
  db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  df:	90                   	nop
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  e0:	0f b6 0b             	movzbl (%ebx),%ecx
  if(re[0] == '$' && re[1] == '\0')
  e3:	80 fa 24             	cmp    $0x24,%dl
  e6:	75 04                	jne    ec <matchhere+0x2c>
  e8:	84 c0                	test   %al,%al
  ea:	74 79                	je     165 <matchhere+0xa5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  ec:	84 c9                	test   %cl,%cl
  ee:	74 58                	je     148 <matchhere+0x88>
  f0:	38 d1                	cmp    %dl,%cl
  f2:	74 05                	je     f9 <matchhere+0x39>
  f4:	80 fa 2e             	cmp    $0x2e,%dl
  f7:	75 4f                	jne    148 <matchhere+0x88>
    return matchhere(re+1, text+1);
  f9:	83 c3 01             	add    $0x1,%ebx
  fc:	83 c6 01             	add    $0x1,%esi
  if(re[0] == '\0')
  ff:	84 c0                	test   %al,%al
 101:	74 55                	je     158 <matchhere+0x98>
  if(re[1] == '*')
 103:	89 c2                	mov    %eax,%edx
 105:	0f b6 46 01          	movzbl 0x1(%esi),%eax
 109:	3c 2a                	cmp    $0x2a,%al
 10b:	75 d3                	jne    e0 <matchhere+0x20>
    return matchstar(re[0], re+2, text);
 10d:	83 c6 02             	add    $0x2,%esi
 110:	0f be fa             	movsbl %dl,%edi
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
 113:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 117:	90                   	nop
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 118:	83 ec 08             	sub    $0x8,%esp
 11b:	53                   	push   %ebx
 11c:	56                   	push   %esi
 11d:	e8 9e ff ff ff       	call   c0 <matchhere>
 122:	83 c4 10             	add    $0x10,%esp
 125:	85 c0                	test   %eax,%eax
 127:	75 2f                	jne    158 <matchhere+0x98>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
 129:	0f be 13             	movsbl (%ebx),%edx
 12c:	84 d2                	test   %dl,%dl
 12e:	74 0c                	je     13c <matchhere+0x7c>
 130:	83 c3 01             	add    $0x1,%ebx
 133:	83 ff 2e             	cmp    $0x2e,%edi
 136:	74 e0                	je     118 <matchhere+0x58>
 138:	39 fa                	cmp    %edi,%edx
 13a:	74 dc                	je     118 <matchhere+0x58>
}
 13c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 13f:	5b                   	pop    %ebx
 140:	5e                   	pop    %esi
 141:	5f                   	pop    %edi
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    
 144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 148:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
 14b:	31 c0                	xor    %eax,%eax
}
 14d:	5b                   	pop    %ebx
 14e:	5e                   	pop    %esi
 14f:	5f                   	pop    %edi
 150:	5d                   	pop    %ebp
 151:	c3                   	ret    
 152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 158:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 1;
 15b:	b8 01 00 00 00       	mov    $0x1,%eax
}
 160:	5b                   	pop    %ebx
 161:	5e                   	pop    %esi
 162:	5f                   	pop    %edi
 163:	5d                   	pop    %ebp
 164:	c3                   	ret    
    return *text == '\0';
 165:	31 c0                	xor    %eax,%eax
 167:	84 c9                	test   %cl,%cl
 169:	0f 94 c0             	sete   %al
 16c:	eb ce                	jmp    13c <matchhere+0x7c>
 16e:	66 90                	xchg   %ax,%ax

00000170 <match>:
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	56                   	push   %esi
 174:	53                   	push   %ebx
 175:	8b 5d 08             	mov    0x8(%ebp),%ebx
 178:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(re[0] == '^')
 17b:	80 3b 5e             	cmpb   $0x5e,(%ebx)
 17e:	75 11                	jne    191 <match+0x21>
 180:	eb 2e                	jmp    1b0 <match+0x40>
 182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 188:	83 c6 01             	add    $0x1,%esi
 18b:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 18f:	74 16                	je     1a7 <match+0x37>
    if(matchhere(re, text))
 191:	83 ec 08             	sub    $0x8,%esp
 194:	56                   	push   %esi
 195:	53                   	push   %ebx
 196:	e8 25 ff ff ff       	call   c0 <matchhere>
 19b:	83 c4 10             	add    $0x10,%esp
 19e:	85 c0                	test   %eax,%eax
 1a0:	74 e6                	je     188 <match+0x18>
      return 1;
 1a2:	b8 01 00 00 00       	mov    $0x1,%eax
}
 1a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1aa:	5b                   	pop    %ebx
 1ab:	5e                   	pop    %esi
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret    
 1ae:	66 90                	xchg   %ax,%ax
    return matchhere(re+1, text);
 1b0:	83 c3 01             	add    $0x1,%ebx
 1b3:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 1b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1b9:	5b                   	pop    %ebx
 1ba:	5e                   	pop    %esi
 1bb:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 1bc:	e9 ff fe ff ff       	jmp    c0 <matchhere>
 1c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <grep>:
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	56                   	push   %esi
 1d5:	53                   	push   %ebx
 1d6:	83 ec 1c             	sub    $0x1c,%esp
 1d9:	8b 7d 08             	mov    0x8(%ebp),%edi
  m = 0;
 1dc:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    return matchhere(re+1, text);
 1e3:	8d 47 01             	lea    0x1(%edi),%eax
 1e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 1f0:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 1f3:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 1f8:	83 ec 04             	sub    $0x4,%esp
 1fb:	29 c8                	sub    %ecx,%eax
 1fd:	50                   	push   %eax
 1fe:	8d 81 20 10 00 00    	lea    0x1020(%ecx),%eax
 204:	50                   	push   %eax
 205:	ff 75 0c             	pushl  0xc(%ebp)
 208:	e8 cf 04 00 00       	call   6dc <read>
 20d:	83 c4 10             	add    $0x10,%esp
 210:	85 c0                	test   %eax,%eax
 212:	0f 8e e5 00 00 00    	jle    2fd <grep+0x12d>
    m += n;
 218:	01 45 dc             	add    %eax,-0x24(%ebp)
 21b:	8b 4d dc             	mov    -0x24(%ebp),%ecx
    p = buf;
 21e:	c7 45 e4 20 10 00 00 	movl   $0x1020,-0x1c(%ebp)
    buf[m] = '\0';
 225:	c6 81 20 10 00 00 00 	movb   $0x0,0x1020(%ecx)
    while((q = strchr(p, '\n')) != 0){
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 230:	83 ec 08             	sub    $0x8,%esp
 233:	6a 0a                	push   $0xa
 235:	ff 75 e4             	pushl  -0x1c(%ebp)
 238:	e8 03 02 00 00       	call   440 <strchr>
 23d:	83 c4 10             	add    $0x10,%esp
 240:	89 c3                	mov    %eax,%ebx
 242:	85 c0                	test   %eax,%eax
 244:	74 72                	je     2b8 <grep+0xe8>
      *q = 0;
 246:	c6 03 00             	movb   $0x0,(%ebx)
        write(1, p, q+1 - p);
 249:	8d 43 01             	lea    0x1(%ebx),%eax
  if(re[0] == '^')
 24c:	80 3f 5e             	cmpb   $0x5e,(%edi)
        write(1, p, q+1 - p);
 24f:	89 45 e0             	mov    %eax,-0x20(%ebp)
 252:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  if(re[0] == '^')
 255:	75 12                	jne    269 <grep+0x99>
 257:	eb 47                	jmp    2a0 <grep+0xd0>
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }while(*text++ != '\0');
 260:	83 c6 01             	add    $0x1,%esi
 263:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 267:	74 2b                	je     294 <grep+0xc4>
    if(matchhere(re, text))
 269:	83 ec 08             	sub    $0x8,%esp
 26c:	56                   	push   %esi
 26d:	57                   	push   %edi
 26e:	e8 4d fe ff ff       	call   c0 <matchhere>
 273:	83 c4 10             	add    $0x10,%esp
 276:	85 c0                	test   %eax,%eax
 278:	74 e6                	je     260 <grep+0x90>
        write(1, p, q+1 - p);
 27a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 27d:	8b 45 e0             	mov    -0x20(%ebp),%eax
 280:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 283:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 286:	29 d0                	sub    %edx,%eax
 288:	50                   	push   %eax
 289:	52                   	push   %edx
 28a:	6a 01                	push   $0x1
 28c:	e8 53 04 00 00       	call   6e4 <write>
 291:	83 c4 10             	add    $0x10,%esp
      p = q+1;
 294:	8b 45 e0             	mov    -0x20(%ebp),%eax
 297:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 29a:	eb 94                	jmp    230 <grep+0x60>
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return matchhere(re+1, text);
 2a0:	83 ec 08             	sub    $0x8,%esp
 2a3:	56                   	push   %esi
 2a4:	ff 75 d8             	pushl  -0x28(%ebp)
 2a7:	e8 14 fe ff ff       	call   c0 <matchhere>
 2ac:	83 c4 10             	add    $0x10,%esp
      if(match(pattern, p)){
 2af:	85 c0                	test   %eax,%eax
 2b1:	74 e1                	je     294 <grep+0xc4>
 2b3:	eb c5                	jmp    27a <grep+0xaa>
 2b5:	8d 76 00             	lea    0x0(%esi),%esi
    if(p == buf)
 2b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2bb:	81 fa 20 10 00 00    	cmp    $0x1020,%edx
 2c1:	74 2e                	je     2f1 <grep+0x121>
    if(m > 0){
 2c3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 2c6:	85 c9                	test   %ecx,%ecx
 2c8:	0f 8e 22 ff ff ff    	jle    1f0 <grep+0x20>
      m -= p - buf;
 2ce:	89 d0                	mov    %edx,%eax
      memmove(buf, p, m);
 2d0:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 2d3:	2d 20 10 00 00       	sub    $0x1020,%eax
 2d8:	29 c1                	sub    %eax,%ecx
      memmove(buf, p, m);
 2da:	51                   	push   %ecx
 2db:	52                   	push   %edx
 2dc:	68 20 10 00 00       	push   $0x1020
      m -= p - buf;
 2e1:	89 4d dc             	mov    %ecx,-0x24(%ebp)
      memmove(buf, p, m);
 2e4:	e8 a7 02 00 00       	call   590 <memmove>
 2e9:	83 c4 10             	add    $0x10,%esp
 2ec:	e9 ff fe ff ff       	jmp    1f0 <grep+0x20>
      m = 0;
 2f1:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 2f8:	e9 f3 fe ff ff       	jmp    1f0 <grep+0x20>
}
 2fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 300:	5b                   	pop    %ebx
 301:	5e                   	pop    %esi
 302:	5f                   	pop    %edi
 303:	5d                   	pop    %ebp
 304:	c3                   	ret    
 305:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <matchstar>:
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	56                   	push   %esi
 315:	53                   	push   %ebx
 316:	83 ec 0c             	sub    $0xc,%esp
 319:	8b 5d 08             	mov    0x8(%ebp),%ebx
 31c:	8b 75 0c             	mov    0xc(%ebp),%esi
 31f:	8b 7d 10             	mov    0x10(%ebp),%edi
 322:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(matchhere(re, text))
 328:	83 ec 08             	sub    $0x8,%esp
 32b:	57                   	push   %edi
 32c:	56                   	push   %esi
 32d:	e8 8e fd ff ff       	call   c0 <matchhere>
 332:	83 c4 10             	add    $0x10,%esp
 335:	89 c2                	mov    %eax,%edx
 337:	85 c0                	test   %eax,%eax
 339:	75 25                	jne    360 <matchstar+0x50>
  }while(*text!='\0' && (*text++==c || c=='.'));
 33b:	0f be 07             	movsbl (%edi),%eax
 33e:	84 c0                	test   %al,%al
 340:	74 0c                	je     34e <matchstar+0x3e>
 342:	83 c7 01             	add    $0x1,%edi
 345:	39 d8                	cmp    %ebx,%eax
 347:	74 df                	je     328 <matchstar+0x18>
 349:	83 fb 2e             	cmp    $0x2e,%ebx
 34c:	74 da                	je     328 <matchstar+0x18>
}
 34e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 351:	89 d0                	mov    %edx,%eax
 353:	5b                   	pop    %ebx
 354:	5e                   	pop    %esi
 355:	5f                   	pop    %edi
 356:	5d                   	pop    %ebp
 357:	c3                   	ret    
 358:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop
 360:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 1;
 363:	ba 01 00 00 00       	mov    $0x1,%edx
}
 368:	5b                   	pop    %ebx
 369:	89 d0                	mov    %edx,%eax
 36b:	5e                   	pop    %esi
 36c:	5f                   	pop    %edi
 36d:	5d                   	pop    %ebp
 36e:	c3                   	ret    
 36f:	90                   	nop

00000370 <strcpy>:

struct ptr_struct ptrs[64];

char *
strcpy(char *s, const char *t)
{
 370:	55                   	push   %ebp
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 371:	31 c0                	xor    %eax,%eax
{
 373:	89 e5                	mov    %esp,%ebp
 375:	53                   	push   %ebx
 376:	8b 4d 08             	mov    0x8(%ebp),%ecx
 379:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0)
 380:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 384:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 387:	83 c0 01             	add    $0x1,%eax
 38a:	84 d2                	test   %dl,%dl
 38c:	75 f2                	jne    380 <strcpy+0x10>
    ;
  return os;
}
 38e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 391:	89 c8                	mov    %ecx,%eax
 393:	c9                   	leave  
 394:	c3                   	ret    
 395:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <strcmp>:

int strcmp(const char *p, const char *q)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	53                   	push   %ebx
 3a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 3aa:	0f b6 01             	movzbl (%ecx),%eax
 3ad:	0f b6 1a             	movzbl (%edx),%ebx
 3b0:	84 c0                	test   %al,%al
 3b2:	75 1d                	jne    3d1 <strcmp+0x31>
 3b4:	eb 2a                	jmp    3e0 <strcmp+0x40>
 3b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
 3c0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 3c4:	83 c1 01             	add    $0x1,%ecx
 3c7:	83 c2 01             	add    $0x1,%edx
  return (uchar)*p - (uchar)*q;
 3ca:	0f b6 1a             	movzbl (%edx),%ebx
  while (*p && *p == *q)
 3cd:	84 c0                	test   %al,%al
 3cf:	74 0f                	je     3e0 <strcmp+0x40>
 3d1:	38 d8                	cmp    %bl,%al
 3d3:	74 eb                	je     3c0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 3d5:	29 d8                	sub    %ebx,%eax
}
 3d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3da:	c9                   	leave  
 3db:	c3                   	ret    
 3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3e0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 3e2:	29 d8                	sub    %ebx,%eax
}
 3e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3e7:	c9                   	leave  
 3e8:	c3                   	ret    
 3e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003f0 <strlen>:

uint strlen(const char *s)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for (n = 0; s[n]; n++)
 3f6:	80 3a 00             	cmpb   $0x0,(%edx)
 3f9:	74 15                	je     410 <strlen+0x20>
 3fb:	31 c0                	xor    %eax,%eax
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
 400:	83 c0 01             	add    $0x1,%eax
 403:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 407:	89 c1                	mov    %eax,%ecx
 409:	75 f5                	jne    400 <strlen+0x10>
    ;
  return n;
}
 40b:	89 c8                	mov    %ecx,%eax
 40d:	5d                   	pop    %ebp
 40e:	c3                   	ret    
 40f:	90                   	nop
  for (n = 0; s[n]; n++)
 410:	31 c9                	xor    %ecx,%ecx
}
 412:	5d                   	pop    %ebp
 413:	89 c8                	mov    %ecx,%eax
 415:	c3                   	ret    
 416:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41d:	8d 76 00             	lea    0x0(%esi),%esi

00000420 <memset>:

void *
memset(void *dst, int c, uint n)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 427:	8b 4d 10             	mov    0x10(%ebp),%ecx
 42a:	8b 45 0c             	mov    0xc(%ebp),%eax
 42d:	89 d7                	mov    %edx,%edi
 42f:	fc                   	cld    
 430:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 432:	8b 7d fc             	mov    -0x4(%ebp),%edi
 435:	89 d0                	mov    %edx,%eax
 437:	c9                   	leave  
 438:	c3                   	ret    
 439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000440 <strchr>:

char *
strchr(const char *s, char c)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	8b 45 08             	mov    0x8(%ebp),%eax
 446:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 44a:	0f b6 10             	movzbl (%eax),%edx
 44d:	84 d2                	test   %dl,%dl
 44f:	75 12                	jne    463 <strchr+0x23>
 451:	eb 1d                	jmp    470 <strchr+0x30>
 453:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 457:	90                   	nop
 458:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 45c:	83 c0 01             	add    $0x1,%eax
 45f:	84 d2                	test   %dl,%dl
 461:	74 0d                	je     470 <strchr+0x30>
    if (*s == c)
 463:	38 d1                	cmp    %dl,%cl
 465:	75 f1                	jne    458 <strchr+0x18>
      return (char *)s;
  return 0;
}
 467:	5d                   	pop    %ebp
 468:	c3                   	ret    
 469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 470:	31 c0                	xor    %eax,%eax
}
 472:	5d                   	pop    %ebp
 473:	c3                   	ret    
 474:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 47f:	90                   	nop

00000480 <gets>:

char *
gets(char *buf, int max)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 485:	31 f6                	xor    %esi,%esi
{
 487:	53                   	push   %ebx
 488:	89 f3                	mov    %esi,%ebx
 48a:	83 ec 1c             	sub    $0x1c,%esp
 48d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for (i = 0; i + 1 < max;)
 490:	eb 2f                	jmp    4c1 <gets+0x41>
 492:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  {
    cc = read(0, &c, 1);
 498:	83 ec 04             	sub    $0x4,%esp
 49b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 49e:	6a 01                	push   $0x1
 4a0:	50                   	push   %eax
 4a1:	6a 00                	push   $0x0
 4a3:	e8 34 02 00 00       	call   6dc <read>
    if (cc < 1)
 4a8:	83 c4 10             	add    $0x10,%esp
 4ab:	85 c0                	test   %eax,%eax
 4ad:	7e 1c                	jle    4cb <gets+0x4b>
      break;
    buf[i++] = c;
 4af:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    if (c == '\n' || c == '\r')
 4b3:	83 c7 01             	add    $0x1,%edi
    buf[i++] = c;
 4b6:	88 47 ff             	mov    %al,-0x1(%edi)
    if (c == '\n' || c == '\r')
 4b9:	3c 0a                	cmp    $0xa,%al
 4bb:	74 23                	je     4e0 <gets+0x60>
 4bd:	3c 0d                	cmp    $0xd,%al
 4bf:	74 1f                	je     4e0 <gets+0x60>
  for (i = 0; i + 1 < max;)
 4c1:	83 c3 01             	add    $0x1,%ebx
    buf[i++] = c;
 4c4:	89 fe                	mov    %edi,%esi
  for (i = 0; i + 1 < max;)
 4c6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4c9:	7c cd                	jl     498 <gets+0x18>
 4cb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 4cd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 4d0:	c6 03 00             	movb   $0x0,(%ebx)
}
 4d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4d6:	5b                   	pop    %ebx
 4d7:	5e                   	pop    %esi
 4d8:	5f                   	pop    %edi
 4d9:	5d                   	pop    %ebp
 4da:	c3                   	ret    
 4db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4df:	90                   	nop
  buf[i] = '\0';
 4e0:	8b 75 08             	mov    0x8(%ebp),%esi
}
 4e3:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 4e6:	01 de                	add    %ebx,%esi
 4e8:	89 f3                	mov    %esi,%ebx
 4ea:	c6 03 00             	movb   $0x0,(%ebx)
}
 4ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4f0:	5b                   	pop    %ebx
 4f1:	5e                   	pop    %esi
 4f2:	5f                   	pop    %edi
 4f3:	5d                   	pop    %ebp
 4f4:	c3                   	ret    
 4f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000500 <stat>:

int stat(const char *n, struct stat *st)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	56                   	push   %esi
 504:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 505:	83 ec 08             	sub    $0x8,%esp
 508:	6a 00                	push   $0x0
 50a:	ff 75 08             	pushl  0x8(%ebp)
 50d:	e8 f2 01 00 00       	call   704 <open>
  if (fd < 0)
 512:	83 c4 10             	add    $0x10,%esp
 515:	85 c0                	test   %eax,%eax
 517:	78 27                	js     540 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 519:	83 ec 08             	sub    $0x8,%esp
 51c:	ff 75 0c             	pushl  0xc(%ebp)
 51f:	89 c3                	mov    %eax,%ebx
 521:	50                   	push   %eax
 522:	e8 f5 01 00 00       	call   71c <fstat>
  close(fd);
 527:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 52a:	89 c6                	mov    %eax,%esi
  close(fd);
 52c:	e8 bb 01 00 00       	call   6ec <close>
  return r;
 531:	83 c4 10             	add    $0x10,%esp
}
 534:	8d 65 f8             	lea    -0x8(%ebp),%esp
 537:	89 f0                	mov    %esi,%eax
 539:	5b                   	pop    %ebx
 53a:	5e                   	pop    %esi
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    
 53d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 540:	be ff ff ff ff       	mov    $0xffffffff,%esi
 545:	eb ed                	jmp    534 <stat+0x34>
 547:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54e:	66 90                	xchg   %ax,%ax

00000550 <atoi>:

int atoi(const char *s)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	53                   	push   %ebx
 554:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while ('0' <= *s && *s <= '9')
 557:	0f be 02             	movsbl (%edx),%eax
 55a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 55d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 560:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 565:	77 1e                	ja     585 <atoi+0x35>
 567:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56e:	66 90                	xchg   %ax,%ax
    n = n * 10 + *s++ - '0';
 570:	83 c2 01             	add    $0x1,%edx
 573:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 576:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 57a:	0f be 02             	movsbl (%edx),%eax
 57d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 580:	80 fb 09             	cmp    $0x9,%bl
 583:	76 eb                	jbe    570 <atoi+0x20>
  return n;
}
 585:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 588:	89 c8                	mov    %ecx,%eax
 58a:	c9                   	leave  
 58b:	c3                   	ret    
 58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000590 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	8b 45 10             	mov    0x10(%ebp),%eax
 597:	8b 55 08             	mov    0x8(%ebp),%edx
 59a:	56                   	push   %esi
 59b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while (n-- > 0)
 59e:	85 c0                	test   %eax,%eax
 5a0:	7e 13                	jle    5b5 <memmove+0x25>
 5a2:	01 d0                	add    %edx,%eax
  dst = vdst;
 5a4:	89 d7                	mov    %edx,%edi
 5a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 5b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 5b1:	39 f8                	cmp    %edi,%eax
 5b3:	75 fb                	jne    5b0 <memmove+0x20>
  return vdst;
}
 5b5:	5e                   	pop    %esi
 5b6:	89 d0                	mov    %edx,%eax
 5b8:	5f                   	pop    %edi
 5b9:	5d                   	pop    %ebp
 5ba:	c3                   	ret    
 5bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5bf:	90                   	nop

000005c0 <new_lock>:

// new
void new_lock(my_lock *l)
{
  ;
}
 5c0:	c3                   	ret    
 5c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cf:	90                   	nop

000005d0 <lock>:
 5d0:	c3                   	ret    
 5d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop

000005e0 <unlock>:
 5e0:	c3                   	ret    
 5e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ef:	90                   	nop

000005f0 <thread_create>:
{
  ;
}

int thread_create(void (*fn)(void *), void *arg)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	83 ec 14             	sub    $0x14,%esp
  void *thread_stack_pointer = malloc(PGSIZE * 2);
 5f6:	68 00 20 00 00       	push   $0x2000
 5fb:	e8 90 04 00 00       	call   a90 <malloc>

  if (thread_stack_pointer == 0)
 600:	83 c4 10             	add    $0x10,%esp
 603:	85 c0                	test   %eax,%eax
 605:	74 25                	je     62c <thread_create+0x3c>
    return -1;

  // Check allocated stack is complete
  if ((uint)thread_stack_pointer % PGSIZE) // if not complete then add more
 607:	89 c2                	mov    %eax,%edx
 609:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 60f:	74 07                	je     618 <thread_create+0x28>
    thread_stack_pointer = thread_stack_pointer + (PGSIZE - ((uint)thread_stack_pointer % PGSIZE));
 611:	29 d0                	sub    %edx,%eax
 613:	05 00 10 00 00       	add    $0x1000,%eax

  int thread_id = clone(fn, arg, thread_stack_pointer);
 618:	83 ec 04             	sub    $0x4,%esp
 61b:	50                   	push   %eax
 61c:	ff 75 0c             	pushl  0xc(%ebp)
 61f:	ff 75 08             	pushl  0x8(%ebp)
 622:	e8 3d 01 00 00       	call   764 <clone>
  return thread_id;
 627:	83 c4 10             	add    $0x10,%esp
}
 62a:	c9                   	leave  
 62b:	c3                   	ret    
 62c:	c9                   	leave  
    return -1;
 62d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 632:	c3                   	ret    
 633:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000640 <thread_join>:

int thread_join()
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
  void* stack;
  int ret = join(&stack);
 645:	8d 45 e4             	lea    -0x1c(%ebp),%eax
{
 648:	53                   	push   %ebx
 649:	83 ec 28             	sub    $0x28,%esp
  int ret = join(&stack);
 64c:	50                   	push   %eax
 64d:	e8 1a 01 00 00       	call   76c <join>
  // Checking if all the children are zombie
  for(int i = 0; i < 64; i++){
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 652:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 655:	83 c4 10             	add    $0x10,%esp
  for(int i = 0; i < 64; i++){
 658:	31 d2                	xor    %edx,%edx
  int ret = join(&stack);
 65a:	89 c3                	mov    %eax,%ebx
  for(int i = 0; i < 64; i++){
 65c:	b8 20 14 00 00       	mov    $0x1420,%eax
 661:	eb 10                	jmp    673 <thread_join+0x33>
 663:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 667:	90                   	nop
 668:	83 c2 01             	add    $0x1,%edx
 66b:	83 c0 0c             	add    $0xc,%eax
 66e:	83 fa 40             	cmp    $0x40,%edx
 671:	74 3f                	je     6b2 <thread_join+0x72>
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 673:	83 38 01             	cmpl   $0x1,(%eax)
 676:	75 f0                	jne    668 <thread_join+0x28>
 678:	39 48 08             	cmp    %ecx,0x8(%eax)
 67b:	75 eb                	jne    668 <thread_join+0x28>
      free(ptrs[i].ptr);
 67d:	8d 34 52             	lea    (%edx,%edx,2),%esi
 680:	83 ec 0c             	sub    $0xc,%esp
 683:	c1 e6 02             	shl    $0x2,%esi
 686:	ff b6 24 14 00 00    	pushl  0x1424(%esi)
 68c:	e8 6f 03 00 00       	call   a00 <free>
      ptrs[i].stack = NULL;
      ptrs[i].busy = 0;
      ptrs[i].ptr = NULL;
      break;
 691:	83 c4 10             	add    $0x10,%esp
      ptrs[i].stack = NULL;
 694:	c7 86 28 14 00 00 00 	movl   $0x0,0x1428(%esi)
 69b:	00 00 00 
      ptrs[i].busy = 0;
 69e:	c7 86 20 14 00 00 00 	movl   $0x0,0x1420(%esi)
 6a5:	00 00 00 
      ptrs[i].ptr = NULL;
 6a8:	c7 86 24 14 00 00 00 	movl   $0x0,0x1424(%esi)
 6af:	00 00 00 
    }
  }
  return ret;
}
 6b2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6b5:	89 d8                	mov    %ebx,%eax
 6b7:	5b                   	pop    %ebx
 6b8:	5e                   	pop    %esi
 6b9:	5f                   	pop    %edi
 6ba:	5d                   	pop    %ebp
 6bb:	c3                   	ret    

000006bc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6bc:	b8 01 00 00 00       	mov    $0x1,%eax
 6c1:	cd 40                	int    $0x40
 6c3:	c3                   	ret    

000006c4 <exit>:
SYSCALL(exit)
 6c4:	b8 02 00 00 00       	mov    $0x2,%eax
 6c9:	cd 40                	int    $0x40
 6cb:	c3                   	ret    

000006cc <wait>:
SYSCALL(wait)
 6cc:	b8 03 00 00 00       	mov    $0x3,%eax
 6d1:	cd 40                	int    $0x40
 6d3:	c3                   	ret    

000006d4 <pipe>:
SYSCALL(pipe)
 6d4:	b8 04 00 00 00       	mov    $0x4,%eax
 6d9:	cd 40                	int    $0x40
 6db:	c3                   	ret    

000006dc <read>:
SYSCALL(read)
 6dc:	b8 05 00 00 00       	mov    $0x5,%eax
 6e1:	cd 40                	int    $0x40
 6e3:	c3                   	ret    

000006e4 <write>:
SYSCALL(write)
 6e4:	b8 10 00 00 00       	mov    $0x10,%eax
 6e9:	cd 40                	int    $0x40
 6eb:	c3                   	ret    

000006ec <close>:
SYSCALL(close)
 6ec:	b8 15 00 00 00       	mov    $0x15,%eax
 6f1:	cd 40                	int    $0x40
 6f3:	c3                   	ret    

000006f4 <kill>:
SYSCALL(kill)
 6f4:	b8 06 00 00 00       	mov    $0x6,%eax
 6f9:	cd 40                	int    $0x40
 6fb:	c3                   	ret    

000006fc <exec>:
SYSCALL(exec)
 6fc:	b8 07 00 00 00       	mov    $0x7,%eax
 701:	cd 40                	int    $0x40
 703:	c3                   	ret    

00000704 <open>:
SYSCALL(open)
 704:	b8 0f 00 00 00       	mov    $0xf,%eax
 709:	cd 40                	int    $0x40
 70b:	c3                   	ret    

0000070c <mknod>:
SYSCALL(mknod)
 70c:	b8 11 00 00 00       	mov    $0x11,%eax
 711:	cd 40                	int    $0x40
 713:	c3                   	ret    

00000714 <unlink>:
SYSCALL(unlink)
 714:	b8 12 00 00 00       	mov    $0x12,%eax
 719:	cd 40                	int    $0x40
 71b:	c3                   	ret    

0000071c <fstat>:
SYSCALL(fstat)
 71c:	b8 08 00 00 00       	mov    $0x8,%eax
 721:	cd 40                	int    $0x40
 723:	c3                   	ret    

00000724 <link>:
SYSCALL(link)
 724:	b8 13 00 00 00       	mov    $0x13,%eax
 729:	cd 40                	int    $0x40
 72b:	c3                   	ret    

0000072c <mkdir>:
SYSCALL(mkdir)
 72c:	b8 14 00 00 00       	mov    $0x14,%eax
 731:	cd 40                	int    $0x40
 733:	c3                   	ret    

00000734 <chdir>:
SYSCALL(chdir)
 734:	b8 09 00 00 00       	mov    $0x9,%eax
 739:	cd 40                	int    $0x40
 73b:	c3                   	ret    

0000073c <dup>:
SYSCALL(dup)
 73c:	b8 0a 00 00 00       	mov    $0xa,%eax
 741:	cd 40                	int    $0x40
 743:	c3                   	ret    

00000744 <getpid>:
SYSCALL(getpid)
 744:	b8 0b 00 00 00       	mov    $0xb,%eax
 749:	cd 40                	int    $0x40
 74b:	c3                   	ret    

0000074c <sbrk>:
SYSCALL(sbrk)
 74c:	b8 0c 00 00 00       	mov    $0xc,%eax
 751:	cd 40                	int    $0x40
 753:	c3                   	ret    

00000754 <sleep>:
SYSCALL(sleep)
 754:	b8 0d 00 00 00       	mov    $0xd,%eax
 759:	cd 40                	int    $0x40
 75b:	c3                   	ret    

0000075c <uptime>:
SYSCALL(uptime)
 75c:	b8 0e 00 00 00       	mov    $0xe,%eax
 761:	cd 40                	int    $0x40
 763:	c3                   	ret    

00000764 <clone>:
// new
SYSCALL(clone)
 764:	b8 16 00 00 00       	mov    $0x16,%eax
 769:	cd 40                	int    $0x40
 76b:	c3                   	ret    

0000076c <join>:
SYSCALL(join)
 76c:	b8 17 00 00 00       	mov    $0x17,%eax
 771:	cd 40                	int    $0x40
 773:	c3                   	ret    
 774:	66 90                	xchg   %ax,%ax
 776:	66 90                	xchg   %ax,%ax
 778:	66 90                	xchg   %ax,%ax
 77a:	66 90                	xchg   %ax,%ax
 77c:	66 90                	xchg   %ax,%ax
 77e:	66 90                	xchg   %ax,%ax

00000780 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	83 ec 3c             	sub    $0x3c,%esp
 789:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 78c:	89 d1                	mov    %edx,%ecx
{
 78e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 791:	85 d2                	test   %edx,%edx
 793:	0f 89 7f 00 00 00    	jns    818 <printint+0x98>
 799:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 79d:	74 79                	je     818 <printint+0x98>
    neg = 1;
 79f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 7a6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 7a8:	31 db                	xor    %ebx,%ebx
 7aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 7ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 7b0:	89 c8                	mov    %ecx,%eax
 7b2:	31 d2                	xor    %edx,%edx
 7b4:	89 cf                	mov    %ecx,%edi
 7b6:	f7 75 c4             	divl   -0x3c(%ebp)
 7b9:	0f b6 92 d8 0b 00 00 	movzbl 0xbd8(%edx),%edx
 7c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 7c3:	89 d8                	mov    %ebx,%eax
 7c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 7c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 7cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 7ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 7d1:	76 dd                	jbe    7b0 <printint+0x30>
  if(neg)
 7d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 7d6:	85 c9                	test   %ecx,%ecx
 7d8:	74 0c                	je     7e6 <printint+0x66>
    buf[i++] = '-';
 7da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 7df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 7e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 7e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 7e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 7ed:	eb 07                	jmp    7f6 <printint+0x76>
 7ef:	90                   	nop
    putc(fd, buf[i]);
 7f0:	0f b6 13             	movzbl (%ebx),%edx
 7f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 7f6:	83 ec 04             	sub    $0x4,%esp
 7f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 7fc:	6a 01                	push   $0x1
 7fe:	56                   	push   %esi
 7ff:	57                   	push   %edi
 800:	e8 df fe ff ff       	call   6e4 <write>
  while(--i >= 0)
 805:	83 c4 10             	add    $0x10,%esp
 808:	39 de                	cmp    %ebx,%esi
 80a:	75 e4                	jne    7f0 <printint+0x70>
}
 80c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 80f:	5b                   	pop    %ebx
 810:	5e                   	pop    %esi
 811:	5f                   	pop    %edi
 812:	5d                   	pop    %ebp
 813:	c3                   	ret    
 814:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 818:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 81f:	eb 87                	jmp    7a8 <printint+0x28>
 821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 828:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 82f:	90                   	nop

00000830 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 830:	55                   	push   %ebp
 831:	89 e5                	mov    %esp,%ebp
 833:	57                   	push   %edi
 834:	56                   	push   %esi
 835:	53                   	push   %ebx
 836:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 839:	8b 75 0c             	mov    0xc(%ebp),%esi
 83c:	0f b6 1e             	movzbl (%esi),%ebx
 83f:	84 db                	test   %bl,%bl
 841:	0f 84 b8 00 00 00    	je     8ff <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 847:	8d 45 10             	lea    0x10(%ebp),%eax
 84a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 84d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 850:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 852:	89 45 d0             	mov    %eax,-0x30(%ebp)
 855:	eb 37                	jmp    88e <printf+0x5e>
 857:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85e:	66 90                	xchg   %ax,%ax
 860:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 863:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 868:	83 f8 25             	cmp    $0x25,%eax
 86b:	74 17                	je     884 <printf+0x54>
  write(fd, &c, 1);
 86d:	83 ec 04             	sub    $0x4,%esp
 870:	88 5d e7             	mov    %bl,-0x19(%ebp)
 873:	6a 01                	push   $0x1
 875:	57                   	push   %edi
 876:	ff 75 08             	pushl  0x8(%ebp)
 879:	e8 66 fe ff ff       	call   6e4 <write>
 87e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 881:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 884:	0f b6 1e             	movzbl (%esi),%ebx
 887:	83 c6 01             	add    $0x1,%esi
 88a:	84 db                	test   %bl,%bl
 88c:	74 71                	je     8ff <printf+0xcf>
    c = fmt[i] & 0xff;
 88e:	0f be cb             	movsbl %bl,%ecx
 891:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 894:	85 d2                	test   %edx,%edx
 896:	74 c8                	je     860 <printf+0x30>
      }
    } else if(state == '%'){
 898:	83 fa 25             	cmp    $0x25,%edx
 89b:	75 e7                	jne    884 <printf+0x54>
      if(c == 'd'){
 89d:	83 f8 64             	cmp    $0x64,%eax
 8a0:	0f 84 9a 00 00 00    	je     940 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8a6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 8ac:	83 f9 70             	cmp    $0x70,%ecx
 8af:	74 5f                	je     910 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8b1:	83 f8 73             	cmp    $0x73,%eax
 8b4:	0f 84 d6 00 00 00    	je     990 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8ba:	83 f8 63             	cmp    $0x63,%eax
 8bd:	0f 84 8d 00 00 00    	je     950 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8c3:	83 f8 25             	cmp    $0x25,%eax
 8c6:	0f 84 b4 00 00 00    	je     980 <printf+0x150>
  write(fd, &c, 1);
 8cc:	83 ec 04             	sub    $0x4,%esp
 8cf:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 8d3:	6a 01                	push   $0x1
 8d5:	57                   	push   %edi
 8d6:	ff 75 08             	pushl  0x8(%ebp)
 8d9:	e8 06 fe ff ff       	call   6e4 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 8de:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 8e1:	83 c4 0c             	add    $0xc,%esp
 8e4:	6a 01                	push   $0x1
  for(i = 0; fmt[i]; i++){
 8e6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 8e9:	57                   	push   %edi
 8ea:	ff 75 08             	pushl  0x8(%ebp)
 8ed:	e8 f2 fd ff ff       	call   6e4 <write>
  for(i = 0; fmt[i]; i++){
 8f2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 8f6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 8f9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 8fb:	84 db                	test   %bl,%bl
 8fd:	75 8f                	jne    88e <printf+0x5e>
    }
  }
}
 8ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
 902:	5b                   	pop    %ebx
 903:	5e                   	pop    %esi
 904:	5f                   	pop    %edi
 905:	5d                   	pop    %ebp
 906:	c3                   	ret    
 907:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 90e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 910:	83 ec 0c             	sub    $0xc,%esp
 913:	b9 10 00 00 00       	mov    $0x10,%ecx
 918:	6a 00                	push   $0x0
 91a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 91d:	8b 45 08             	mov    0x8(%ebp),%eax
 920:	8b 13                	mov    (%ebx),%edx
 922:	e8 59 fe ff ff       	call   780 <printint>
        ap++;
 927:	89 d8                	mov    %ebx,%eax
 929:	83 c4 10             	add    $0x10,%esp
      state = 0;
 92c:	31 d2                	xor    %edx,%edx
        ap++;
 92e:	83 c0 04             	add    $0x4,%eax
 931:	89 45 d0             	mov    %eax,-0x30(%ebp)
 934:	e9 4b ff ff ff       	jmp    884 <printf+0x54>
 939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 940:	83 ec 0c             	sub    $0xc,%esp
 943:	b9 0a 00 00 00       	mov    $0xa,%ecx
 948:	6a 01                	push   $0x1
 94a:	eb ce                	jmp    91a <printf+0xea>
 94c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 950:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 953:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 956:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 958:	6a 01                	push   $0x1
        ap++;
 95a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 95d:	57                   	push   %edi
 95e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 961:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 964:	e8 7b fd ff ff       	call   6e4 <write>
        ap++;
 969:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 96c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 96f:	31 d2                	xor    %edx,%edx
 971:	e9 0e ff ff ff       	jmp    884 <printf+0x54>
 976:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 97d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 980:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 983:	83 ec 04             	sub    $0x4,%esp
 986:	e9 59 ff ff ff       	jmp    8e4 <printf+0xb4>
 98b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 98f:	90                   	nop
        s = (char*)*ap;
 990:	8b 45 d0             	mov    -0x30(%ebp),%eax
 993:	8b 18                	mov    (%eax),%ebx
        ap++;
 995:	83 c0 04             	add    $0x4,%eax
 998:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 99b:	85 db                	test   %ebx,%ebx
 99d:	74 17                	je     9b6 <printf+0x186>
        while(*s != 0){
 99f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 9a2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 9a4:	84 c0                	test   %al,%al
 9a6:	0f 84 d8 fe ff ff    	je     884 <printf+0x54>
 9ac:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 9af:	89 de                	mov    %ebx,%esi
 9b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9b4:	eb 1a                	jmp    9d0 <printf+0x1a0>
          s = "(null)";
 9b6:	bb ce 0b 00 00       	mov    $0xbce,%ebx
        while(*s != 0){
 9bb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 9be:	b8 28 00 00 00       	mov    $0x28,%eax
 9c3:	89 de                	mov    %ebx,%esi
 9c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9cf:	90                   	nop
  write(fd, &c, 1);
 9d0:	83 ec 04             	sub    $0x4,%esp
          s++;
 9d3:	83 c6 01             	add    $0x1,%esi
 9d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 9d9:	6a 01                	push   $0x1
 9db:	57                   	push   %edi
 9dc:	53                   	push   %ebx
 9dd:	e8 02 fd ff ff       	call   6e4 <write>
        while(*s != 0){
 9e2:	0f b6 06             	movzbl (%esi),%eax
 9e5:	83 c4 10             	add    $0x10,%esp
 9e8:	84 c0                	test   %al,%al
 9ea:	75 e4                	jne    9d0 <printf+0x1a0>
      state = 0;
 9ec:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 9ef:	31 d2                	xor    %edx,%edx
 9f1:	e9 8e fe ff ff       	jmp    884 <printf+0x54>
 9f6:	66 90                	xchg   %ax,%ax
 9f8:	66 90                	xchg   %ax,%ax
 9fa:	66 90                	xchg   %ax,%ax
 9fc:	66 90                	xchg   %ax,%ax
 9fe:	66 90                	xchg   %ax,%ax

00000a00 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a00:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a01:	a1 20 17 00 00       	mov    0x1720,%eax
{
 a06:	89 e5                	mov    %esp,%ebp
 a08:	57                   	push   %edi
 a09:	56                   	push   %esi
 a0a:	53                   	push   %ebx
 a0b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 a0e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a18:	89 c2                	mov    %eax,%edx
 a1a:	8b 00                	mov    (%eax),%eax
 a1c:	39 ca                	cmp    %ecx,%edx
 a1e:	73 30                	jae    a50 <free+0x50>
 a20:	39 c1                	cmp    %eax,%ecx
 a22:	72 04                	jb     a28 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a24:	39 c2                	cmp    %eax,%edx
 a26:	72 f0                	jb     a18 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a28:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a2b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a2e:	39 f8                	cmp    %edi,%eax
 a30:	74 30                	je     a62 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 a32:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 a35:	8b 42 04             	mov    0x4(%edx),%eax
 a38:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a3b:	39 f1                	cmp    %esi,%ecx
 a3d:	74 3a                	je     a79 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a3f:	89 0a                	mov    %ecx,(%edx)
  freep = p;
}
 a41:	5b                   	pop    %ebx
  freep = p;
 a42:	89 15 20 17 00 00    	mov    %edx,0x1720
}
 a48:	5e                   	pop    %esi
 a49:	5f                   	pop    %edi
 a4a:	5d                   	pop    %ebp
 a4b:	c3                   	ret    
 a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a50:	39 c2                	cmp    %eax,%edx
 a52:	72 c4                	jb     a18 <free+0x18>
 a54:	39 c1                	cmp    %eax,%ecx
 a56:	73 c0                	jae    a18 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 a58:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a5b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a5e:	39 f8                	cmp    %edi,%eax
 a60:	75 d0                	jne    a32 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 a62:	03 70 04             	add    0x4(%eax),%esi
 a65:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a68:	8b 02                	mov    (%edx),%eax
 a6a:	8b 00                	mov    (%eax),%eax
 a6c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 a6f:	8b 42 04             	mov    0x4(%edx),%eax
 a72:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a75:	39 f1                	cmp    %esi,%ecx
 a77:	75 c6                	jne    a3f <free+0x3f>
    p->s.size += bp->s.size;
 a79:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 a7c:	89 15 20 17 00 00    	mov    %edx,0x1720
    p->s.size += bp->s.size;
 a82:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 a85:	8b 43 f8             	mov    -0x8(%ebx),%eax
 a88:	89 02                	mov    %eax,(%edx)
}
 a8a:	5b                   	pop    %ebx
 a8b:	5e                   	pop    %esi
 a8c:	5f                   	pop    %edi
 a8d:	5d                   	pop    %ebp
 a8e:	c3                   	ret    
 a8f:	90                   	nop

00000a90 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a90:	55                   	push   %ebp
 a91:	89 e5                	mov    %esp,%ebp
 a93:	57                   	push   %edi
 a94:	56                   	push   %esi
 a95:	53                   	push   %ebx
 a96:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a99:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a9c:	8b 3d 20 17 00 00    	mov    0x1720,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 aa2:	8d 70 07             	lea    0x7(%eax),%esi
 aa5:	c1 ee 03             	shr    $0x3,%esi
 aa8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 aab:	85 ff                	test   %edi,%edi
 aad:	0f 84 ad 00 00 00    	je     b60 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab3:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 ab5:	8b 48 04             	mov    0x4(%eax),%ecx
 ab8:	39 f1                	cmp    %esi,%ecx
 aba:	73 71                	jae    b2d <malloc+0x9d>
 abc:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 ac2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 ac7:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 aca:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 ad1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 ad4:	eb 1b                	jmp    af1 <malloc+0x61>
 ad6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 add:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ae0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 ae2:	8b 4a 04             	mov    0x4(%edx),%ecx
 ae5:	39 f1                	cmp    %esi,%ecx
 ae7:	73 4f                	jae    b38 <malloc+0xa8>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ae9:	8b 3d 20 17 00 00    	mov    0x1720,%edi
 aef:	89 d0                	mov    %edx,%eax
 af1:	39 c7                	cmp    %eax,%edi
 af3:	75 eb                	jne    ae0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 af5:	83 ec 0c             	sub    $0xc,%esp
 af8:	ff 75 e4             	pushl  -0x1c(%ebp)
 afb:	e8 4c fc ff ff       	call   74c <sbrk>
  if(p == (char*)-1)
 b00:	83 c4 10             	add    $0x10,%esp
 b03:	83 f8 ff             	cmp    $0xffffffff,%eax
 b06:	74 1b                	je     b23 <malloc+0x93>
  hp->s.size = nu;
 b08:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 b0b:	83 ec 0c             	sub    $0xc,%esp
 b0e:	83 c0 08             	add    $0x8,%eax
 b11:	50                   	push   %eax
 b12:	e8 e9 fe ff ff       	call   a00 <free>
  return freep;
 b17:	a1 20 17 00 00       	mov    0x1720,%eax
      if((p = morecore(nunits)) == 0)
 b1c:	83 c4 10             	add    $0x10,%esp
 b1f:	85 c0                	test   %eax,%eax
 b21:	75 bd                	jne    ae0 <malloc+0x50>
        return 0;
  }
}
 b23:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 b26:	31 c0                	xor    %eax,%eax
}
 b28:	5b                   	pop    %ebx
 b29:	5e                   	pop    %esi
 b2a:	5f                   	pop    %edi
 b2b:	5d                   	pop    %ebp
 b2c:	c3                   	ret    
    if(p->s.size >= nunits){
 b2d:	89 c2                	mov    %eax,%edx
 b2f:	89 f8                	mov    %edi,%eax
 b31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 b38:	39 ce                	cmp    %ecx,%esi
 b3a:	74 54                	je     b90 <malloc+0x100>
        p->s.size -= nunits;
 b3c:	29 f1                	sub    %esi,%ecx
 b3e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 b41:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 b44:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 b47:	a3 20 17 00 00       	mov    %eax,0x1720
}
 b4c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 b4f:	8d 42 08             	lea    0x8(%edx),%eax
}
 b52:	5b                   	pop    %ebx
 b53:	5e                   	pop    %esi
 b54:	5f                   	pop    %edi
 b55:	5d                   	pop    %ebp
 b56:	c3                   	ret    
 b57:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b5e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 b60:	c7 05 20 17 00 00 24 	movl   $0x1724,0x1720
 b67:	17 00 00 
    base.s.size = 0;
 b6a:	bf 24 17 00 00       	mov    $0x1724,%edi
    base.s.ptr = freep = prevp = &base;
 b6f:	c7 05 24 17 00 00 24 	movl   $0x1724,0x1724
 b76:	17 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b79:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 b7b:	c7 05 28 17 00 00 00 	movl   $0x0,0x1728
 b82:	00 00 00 
    if(p->s.size >= nunits){
 b85:	e9 32 ff ff ff       	jmp    abc <malloc+0x2c>
 b8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 b90:	8b 0a                	mov    (%edx),%ecx
 b92:	89 08                	mov    %ecx,(%eax)
 b94:	eb b1                	jmp    b47 <malloc+0xb7>
